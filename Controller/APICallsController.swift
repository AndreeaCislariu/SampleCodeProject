//
//  APICallsController.swift
//  TreatTicket
//
//  Created by AndreeaJipa on 20/03/15.
//  Copyright (c) 2015 TreatTicket. All rights reserved.
//

import Foundation

/*!
 * This class is used as an Interface between the ViewControllers and the API;
 * All methods are class methods, they are used for encapsulating the functionality which just fetches data from the API and parses the result from JSON to NSObjects where applicable;
 * All methods start asynchronously in a background thread (not to block the UI) and returns in main thread, where the response is fetched by the ViewControllers and displayed.
 */
class APICallsController{
    /*!
     * The method used for using a Shopper discount code
     * \param pubKey The Shopper public key
     * \param code The Shopper discount code
     * \param completionHandler the callback handler used to send back this method response
     */
    class func shopperDiscount(pubKey:String, code:String, completionHandler:APICallResult->Void){
        // Dispatch the code to run asynchronous in background thread
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            var parametersDictionary = [APIPostParam_PubKey: pubKey]
            parametersDictionary[APIPostParam_DiscountCode] = code
            
            // Make the API call to make use of Shopper discount code
            APICallsHandler.postRequestWithMethodName(API_Discounts, parametersDictionary:parametersDictionary, completionHandler:{response in
                switch response {
                case .Error(let error):
                    // Handle error
                    ErrorHandler.handleError(ErrorType.ErrorAndCode(error, ErrorsCode.APICallsControllerError))
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                case .Response(let responseObject):
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Response(responseObject))
                    })
                default:
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                }
            })
        })
    }
    
    /*!
     * The method used for getting the user Passbook
     * \param pubKey The Shopper public key
     * \param voucherID The Shopper voucher ID
     * \param completionHandler the callback handler used to send back this method response
     */
    class func getPassbook(pubKey:String, voucherID:String, completionHandler:APICallResult->Void){
        // Dispatch the code to run asynchronous in background thread
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            var parametersDictionary = [APIPostParam_PubKey: pubKey]
            parametersDictionary[APIParam_VoucherID] = voucherID
            
            // Make the API call to get the user Passbook
            APICallsHandler.postRequestDownloadPassWithMethodName(API_VoucherPassbook, parametersDictionary:parametersDictionary, completionHandler:{response in
                switch response {
                case .Error(let error):
                    // Handle error
                    ErrorHandler.handleError(ErrorType.ErrorAndCode(error, ErrorsCode.APICallsControllerError))
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                case .Response(let responseObject):
                    // Handle response
                    if let responseData = responseObject as? NSData{
                        var error:NSError?
                        let pass = PKPass(data: responseData, error:&error)
                            // Send response back on main thread
                            dispatch_async(dispatch_get_main_queue(), {
                                completionHandler(APICallResult.Response(pass))
                            })
                    }
                    else{
                        // Handle error
                        ErrorHandler.handleError(ErrorType.ErrorCode(ErrorsCode.APICallsControllerError))
                        // Send response back on main thread
                        dispatch_async(dispatch_get_main_queue(), {
                            completionHandler(APICallResult.Failure)
                        })
                    }
                default:
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                }
            })
        })
    }
    
    /*!
     * The method used for getting the user Voucher PDF
     * \param pubKey The Shopper public key
     * \param voucherID The Shopper voucher ID
     * \param completionHandler the callback handler used to send back this method response
     */
    class func getVoucherPDF(pubKey:String, voucherID:String, completionHandler:APICallResult->Void){
        // Dispatch the code to run asynchronous in background thread
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            var parametersDictionary = [APIPostParam_PubKey: pubKey]
            parametersDictionary[APIParam_VoucherID] = voucherID
            
            // Make the API call to get the Voucher PDF
            APICallsHandler.postRequestDownloadPDFWithMethodName(API_VoucherPDF, parametersDictionary:parametersDictionary, completionHandler:{response in
                switch response {
                case .Error(let error):
                    // Handle error
                    ErrorHandler.handleError(ErrorType.ErrorAndCode(error, ErrorsCode.APICallsControllerError))
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                case .Response(let responseObject):
                    // Handle the response
                    if let responseData = responseObject as? NSData{
                        if let saveFilePath = Utils.saveDataToDocumentsDirectory(responseData, path: "\(voucherID).pdf", subdirectory: "PDF"){
                            // Send response back on main thread
                            dispatch_async(dispatch_get_main_queue(), {
                                completionHandler(APICallResult.Response(saveFilePath))
                            })
                        }else{
                            ErrorHandler.handleError(ErrorType.ErrorCode(ErrorsCode.WriteToFileError))
                            // Send response back on main thread
                            dispatch_async(dispatch_get_main_queue(), {
                                completionHandler(APICallResult.Failure)
                            })
                        }
                    }
                default:
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                }
            })
        })
    }
    
    /*!
     * The method used for sending a voucher as a Gift
     * \param pubKey The Shopper public key
     * \param voucherID The Shopper voucher ID
     * \param friendEmail The friend email address
     * \param friendName The friend's name
     * \param message The message to be sent to the friend
     * \param completionHandler the callback handler used to send back this method response
     */
    class func sendAsGift(pubKey:String, voucherID:String, friendEmail:String?, friendName:String?, message:String?, completionHandler:APICallResult->Void){
        // Dispatch the code to run asynchronous in background thread
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            // Build the parameters dictionary
            var parametersDictionary = [APIPostParam_PubKey: pubKey]
            if(friendEmail != nil){
                parametersDictionary[APIPostParam_FriendEmail] = friendEmail
            }
            if(friendName != nil){
                parametersDictionary[APIPostParam_FriendName] = friendName
            }
            if(message != nil){
                parametersDictionary[APIPostParam_Message] = message
            }
            parametersDictionary[APIParam_VoucherID] = voucherID
            
            
            // Make the API call to send a voucher as a gift
            APICallsHandler.postRequestWithMethodName(API_SendAsGift, parametersDictionary:parametersDictionary, completionHandler:{response in
                switch response {
                case .Error(let error):
                    // Handle error
                    ErrorHandler.handleError(ErrorType.ErrorAndCode(error, ErrorsCode.APICallsControllerError))
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                case .Response(_):
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.EmptyResponse)
                    })
                default:
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                }
            })
        })
    }
    
    /*!
     * The method used to get the global settings from the API
     * \param completionHandler The callback handler used to send back to the caller the response
     */
    class func globals(completionHandler:APICallResult->Void){
        // Dispatch the code to run asynchronous in background thread
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            
            // Make the API call to get the globals settings
            APICallsHandler.getRequestWithMethodName(API_Globals, parametersDictionary:nil, completionHandler:{response in
                switch response {
                case .Error(let error):
                    // Handle Error
                    ErrorHandler.handleError(ErrorType.ErrorAndCode(error, ErrorsCode.APICallsControllerError))
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                case .Response(let responseObject):
                    // Handle response
                    if let responseDictionary = responseObject as? Dictionary<String, AnyObject>{
                        let globalsDictionary:Globals = Globals(dictionary: responseDictionary)
                        
                        // Send response back on main thread
                        dispatch_async(dispatch_get_main_queue(), {
                            completionHandler(APICallResult.Response(globalsDictionary))
                        })
                    }
                    else {
                        // Handle error response not in correct format
                        ErrorHandler.handleError(ErrorType.ErrorCode(ErrorsCode.APIResponseNotInCorrectFormat))
                        // Send response back on main thread
                        dispatch_async(dispatch_get_main_queue(), {
                            completionHandler(APICallResult.Failure)
                        })
                    }
                default:
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                }
            })
        })
    }
    
    /*!
     * The method used for password recovery functionality
     * \param email The user email used for password recovery
     * \param completionHandler the callback handler used to send back this method response
     */
    class func forgotPassword(email:String, completionHandler:APICallResult->Void){
        // Dispatch the code to run asynchronous in background thread
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            let parametersDictionary = [APIParam_Email: email]
            
            // Make the API call to send the forgot password notice to the API
            APICallsHandler.postRequestWithMethodName(API_ForgotPass, parametersDictionary:parametersDictionary, completionHandler:{response in
                switch response {
                case .Error(let error):
                    // Handle error
                    ErrorHandler.handleError(ErrorType.ErrorAndCode(error, ErrorsCode.APICallsControllerError))
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                case .Response(_):
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.EmptyResponse)
                    })
                default:
                    // Send response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                }
            })
        })
    }
    
    /*!
     * The login method, which logs the current user with the API
     * \param deviceToken The deviceToken generated by Apple, optional
     * \param email The user email address
     * \param password The user password
     * \param completionHandler the callback handler used to send back this method response
     * \returns Shopper object with user Shopper details
     */
    class func login(deviceToken:String?, email:String, password:String, completionHandler:APICallResult->Void) -> Shopper?{
        // Dispatch the code to run asynchronous in background thread
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            
            // Build the parameters Dictionary
            var parametersDictionary = [APIPostParam_Email:email, APIPostParam_Password:password]
            if(deviceToken != nil){
                parametersDictionary[APIPostParam_DeviceToken] = deviceToken
            }
            parametersDictionary[APIParam_DeviceType] = APIPostParam_Type
            
            // Make the API call to login the user
            APICallsHandler.postRequestWithMethodName(API_Login, parametersDictionary:parametersDictionary, completionHandler:{response in
                switch response {
                case .Error(let error):
                    // Handle error
                    let urlResponseCode = error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey]!.statusCode
                    if(urlResponseCode == ErrorsCode.NotAuthorized.rawValue){
                        ErrorHandler.handleError(ErrorType.ErrorCode(ErrorsCode.LoginError))
                    }else{
                        ErrorHandler.handleError(ErrorType.ErrorAndCode(error, ErrorsCode.APICallsControllerError))
                    }
                    
                    // Send response on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                case .Response(let responseObject):
                    // Handle response
                    if let responseDictionary = responseObject as? Dictionary<String, AnyObject>{
                        if let currentShopper = Shopper.shopperWithDictionary(responseDictionary){
                            // Send Response on main thread
                            dispatch_async(dispatch_get_main_queue(), {
                                completionHandler(APICallResult.Response(currentShopper))
                            })
                        }
                        else{
                            // Response data not in expected format
                            ErrorHandler.handleError(ErrorType.ErrorCode(ErrorsCode.APIResponseNotInCorrectFormat))
                            dispatch_async(dispatch_get_main_queue(), {
                                completionHandler(APICallResult.Failure)
                            })
                        }
                    }
                    else {
                        // Response not in expected format
                        ErrorHandler.handleError(ErrorType.ErrorCode(ErrorsCode.APIResponseNotInCorrectFormat))
                        dispatch_async(dispatch_get_main_queue(), {
                            completionHandler(APICallResult.Failure)
                        })
                    }
                default:
                    // The call failed for other reasons, notice main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                }
            })
        })
        
        return nil
    }
    
    /*!
     * The SignUp method used to register the user with the API
     * \param deviceToken The deviceToken generated by Apple, optional
     * \param paramDictionary The Dictionary with User registration data
     * \param completionHandler the callback handler used to send back this method response
     * \returns Shopper object with user Shopper details
     */
    class func signUp(deviceToken:String?, paramDictionary:Dictionary<String, String>, completionHandler:APICallResult->Void) -> Shopper?{
        // Dispatch the code to run asynchronous in background thread
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            // Build the parameters dictionary
            var parametersDictionary = paramDictionary
            if(deviceToken != nil){
                parametersDictionary[APIPostParam_DeviceToken] = deviceToken
            }
            parametersDictionary[APIParam_DeviceType] = APIPostParam_Type
            
            // Make the API call to sign up the user
            APICallsHandler.postRequestWithMethodName(API_Signup, parametersDictionary:parametersDictionary, completionHandler:{response in
                switch response {
                case .Error(let error):
                    // Handle the error
                    let urlResponseCode = error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey]!.statusCode
                    switch(urlResponseCode){
                    case ErrorsCode.NotAuthorized.rawValue:
                        ErrorHandler.handleError(ErrorType.ErrorCode(ErrorsCode.LoginError))
                    case ErrorsCode.EmailAreadyRegistered.rawValue:
                        ErrorHandler.handleError(ErrorType.ErrorCode(ErrorsCode.EmailAreadyRegistered))
                    default:
                        ErrorHandler.handleError(ErrorType.ErrorAndCode(error, ErrorsCode.APICallsControllerError))
                    }
                    
                    // Send response on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                case .Response(let responseObject):
                    // Handle response
                    if let responseDictionary = responseObject as? Dictionary<String, AnyObject>{
                        if let currentShopper = Shopper.shopperWithDictionary(responseDictionary){
                            // Send response on main thread
                            dispatch_async(dispatch_get_main_queue(), {
                                completionHandler(APICallResult.Response(currentShopper))
                            })
                        }
                        else{
                            // Handle response not in correct format
                            ErrorHandler.handleError(ErrorType.ErrorCode(ErrorsCode.APIResponseNotInCorrectFormat))
                            // Send response on main thread
                            dispatch_async(dispatch_get_main_queue(), {
                                completionHandler(APICallResult.Failure)
                            })
                        }
                    }
                    else {
                        // Handle response not in correct format
                        ErrorHandler.handleError(ErrorType.ErrorCode(ErrorsCode.APIResponseNotInCorrectFormat))
                        // Send response on main thread
                        dispatch_async(dispatch_get_main_queue(), {
                            completionHandler(APICallResult.Failure)
                        })
                    }
                default:
                    // Send response on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                }
            })
        })
        
        return nil
    }
    
    /*!
     * The method used to get the threats with category home
     * \param cityID The city ID for the treats
     * \param deviceToken The User device token, optional
     * \param latitude The user location latitude coordonate
     * \param longitude The user location longitude coordonate
     * \param completionHandler the callback handler used to send back this method response
     */
    class func homeTreats(cityID:String?, deviceToken:String?, latitude:Double?, longitude:Double?, completionHandler:APICallResult->Void){
        // Dispatch the code to run asynchronous in background thread
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            // Build the parameters dictionary
            var parametersDictionary:Dictionary<String, String> = Dictionary()
            if(cityID != nil){
                parametersDictionary[APIPostParam_CityID] = cityID!
            }
            if(latitude != nil && longitude != nil ){
                parametersDictionary[APIPostParam_Latitude] = "\(latitude!)"
                parametersDictionary[APIPostParam_Longitude] = "\(longitude!)"
            }
            if(deviceToken != nil){
                parametersDictionary[APIPostParam_DeviceToken] = deviceToken
            }
            parametersDictionary[APIParam_DeviceType] = APIPostParam_Type
            
            // Make the API call to get the home treats list
            APICallsHandler.postRequestWithMethodName(API_Home, parametersDictionary:parametersDictionary, completionHandler:{response in
                switch response {
                case .Error(let error):
                    // Handle the error
                    ErrorHandler.handleError(ErrorType.ErrorAndCode(error, ErrorsCode.APICallsControllerError))
                    // Send response on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                case .Response(let responseObject):
                    // Handle response
                    if let responseDictionary = responseObject as? Dictionary<String, Dictionary<String, Array<Dictionary<String, AnyObject>>>>{
                        var homeTreatsResponse:Dictionary<Int, Array<AnyObject>>?
                        for responseKey in responseDictionary.keys
                        {
                            var listKey = TreatType.Daily.rawValue
                            switch(responseKey){
                            case APIParam_LocalMarket:
                                listKey = TreatType.LocalMarket.rawValue
                            case APIParam_TreatShop:
                                listKey = TreatType.TreatShop.rawValue
                            case APIParam_DiscountCodes:
                                listKey = TreatType.DiscountCodes.rawValue
                            default:print("")
                            }
                            
                            // If are Provider Treats
                            if listKey == TreatType.LocalMarket.rawValue{
                                if let treatsArray = ProviderTreat.providerTreatsFromArrayDictionary(responseDictionary[responseKey]!){
                                    if(treatsArray.count > 0){
                                        if(homeTreatsResponse == nil){
                                            homeTreatsResponse = [listKey:treatsArray]
                                        }
                                        else{
                                            homeTreatsResponse![listKey] = treatsArray
                                        }
                                    }
                                }
                            }
                                // If are Details Treats
                            else if let treatsArray = DetailedTreat.detailedTreatsFromArrayDictionary(responseDictionary[responseKey]!)
                            {
                                if(treatsArray.count > 0){
                                    if(homeTreatsResponse == nil){
                                        homeTreatsResponse = [listKey:treatsArray]
                                    }
                                    else{
                                        homeTreatsResponse![listKey] = treatsArray
                                    }
                                }
                            }
                        }
                        
                        // Send the response back on main thread
                        if homeTreatsResponse != nil{
                            dispatch_async(dispatch_get_main_queue(), {
                                completionHandler(APICallResult.Response(homeTreatsResponse!))
                            })
                        }
                        else{
                            // Return Failure
                            ErrorHandler.handleError(ErrorType.ErrorCode(ErrorsCode.APIResponseNotInCorrectFormat))
                            // Send the response back on main thread
                            dispatch_async(dispatch_get_main_queue(), {
                                completionHandler(APICallResult.Failure)
                            })
                        }
                    }
                    else {
                        // Response not in expected format
                        ErrorHandler.handleError(ErrorType.ErrorCode(ErrorsCode.APIResponseNotInCorrectFormat))
                        // Send response back on main thread
                        dispatch_async(dispatch_get_main_queue(), {
                            completionHandler(APICallResult.Failure)
                        })
                    }
                default:
                    // Send the response back on main thread
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(APICallResult.Failure)
                    })
                }
            })
        })
    }


}
