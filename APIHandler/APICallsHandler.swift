//
//  APICallsHandler.swift
//  TreatTicket
//
//  Created by AndreeaJipa on 06/03/15.
//  Copyright (c) 2015 TreatTicket. All rights reserved.
//

import Foundation

enum APICallResult{
    case Response(AnyObject)
    case Failure
    case EmptyResponse
    case Error(NSError)
    case ErrorString(String)
    case ErrorCode(Int)
}

class APICallsHandler
{
    /*!
     * This method is used to make an GET call to the API_URL
     *
     * \param methodName The methodName for the API call
     * \param parametersDictionary The Dictionary with key - values sent as parameters to the API call, it's optional
     * \param completionHandler The callback block used to send back the response received
     */
    class func getRequestWithMethodName(methodName:String, parametersDictionary:Dictionary<String, AnyObject>?, completionHandler:APICallResult->Void)
    {
        let manager = AFHTTPRequestOperationManager()
        let apiURL = API_URL + methodName
        dLog("apiURL: " + apiURL)
        
        manager.GET(apiURL,
                    parameters:parametersDictionary,
                    success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                        dLog("JSON: " + responseObject.description)
                        completionHandler(APICallResult.Response(responseObject))
            },
                    failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                        dLog("ERROR: " + error.description)
                        completionHandler(APICallResult.Error(error))
        })
    }
    
    /*!
     * This method is used to make an POST call to the API_URL which uses a hash to validate the call
     *
     * \param methodName The methodName for the API call
     * \param parametersDictionary The Dictionary with key - values sent as parameters to the API call, it's optional
     * \param completionHandler The callback block used to send back the response received
     */
    class func postRequestWithMethodName(methodName:String, parametersDictionary:Dictionary<String, AnyObject>?, completionHandler:APICallResult->Void)
    {
        let manager = AFHTTPRequestOperationManager()
        let apiURL = API_URL + methodName
        dLog("apiURL \(apiURL)")
        
        // Add the authentication parameters
        var completeParametersDictionary = parametersDictionary
        if(completeParametersDictionary != nil && completeParametersDictionary![APIPostParam_PubKey] != nil && currentUser!.shopper != nil){
            // Get the current time
            let timeInterval:NSTimeInterval = NSDate().timeIntervalSince1970
            let time:Int = Int(timeInterval)
            
            // Build the Hash
            let shaString = currentUser!.shopper!.privateKey + "-" + currentUser!.shopper!.publicKey + "-" + "\(time)"
            let shaStringEncripted = shaString.SHA256
            
            // Set the authentication parameters
            completeParametersDictionary![APIPostParam_Hash] = shaStringEncripted()
            completeParametersDictionary![APIPostParam_Timestamp] = "\(time)"
            
            // Print the values
            dLog("auth param dictionary \(completeParametersDictionary!)")
        }
        
        manager.POST(apiURL,
                     parameters: completeParametersDictionary!,
                     success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                        dLog("JSON: " + responseObject.description)
                        completionHandler(APICallResult.Response(responseObject))
            },
                     failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                        dLog("ERROR: " + error.description)
                        completionHandler(APICallResult.Error(error))
        })
    }
    
    /*!
     * This method is used to make an POST call to the API_URL to download a PDF
     *
     * \param methodName The methodName for the API call
     * \param parametersDictionary The Dictionary with key - values sent as parameters to the API call, it's optional
     * \param completionHandler The callback block used to send back the response received
     */
    class func postRequestDownloadPDFWithMethodName(methodName:String, parametersDictionary:Dictionary<String, AnyObject>?, completionHandler:APICallResult->Void)
    {
        let manager = AFHTTPRequestOperationManager()
        manager.responseSerializer = AFHTTPResponseSerializer()
        manager.responseSerializer.acceptableContentTypes = NSSet(object: "application/pdf") as Set<NSObject>
        let apiURL = API_URL + methodName
        print("apiURL \(apiURL)")
        
        // Add the authentication parameters
        var completeParametersDictionary = parametersDictionary
        if(completeParametersDictionary != nil && completeParametersDictionary![APIPostParam_PubKey] != nil && currentUser!.shopper != nil){
            // Get the current time
            let timeInterval:NSTimeInterval = NSDate().timeIntervalSince1970
            let time:Int = Int(timeInterval)
            
            // Build the Hash
            let shaString = currentUser!.shopper!.privateKey + "-" + currentUser!.shopper!.publicKey + "-" + "\(time)"
            let shaStringEncripted = shaString.SHA256
            
            // Set the authentication parameters
            completeParametersDictionary![APIPostParam_Hash] = shaStringEncripted()
            completeParametersDictionary![APIPostParam_Timestamp] = "\(time)"
            
            // Print the values
            dLog("auth param dictionary \(completeParametersDictionary!)")
        }
        
        manager.POST(apiURL,
                     parameters: completeParametersDictionary,
                     success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                        completionHandler(APICallResult.Response(responseObject))
            },
                     failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                        dLog("ERROR: " + error.description)
                        completionHandler(APICallResult.Error(error))
        })
        
    }
    
    /*!
     * This method is used to make an POST call to the API_URL to download an Apple pkpass
     *
     * \param methodName The methodName for the API call
     * \param parametersDictionary The Dictionary with key - values sent as parameters to the API call, it's optional
     * \param completionHandler The callback block used to send back the response received
     */
    class func postRequestDownloadPassWithMethodName(methodName:String, parametersDictionary:Dictionary<String, AnyObject>?, completionHandler:APICallResult->Void)
    {
        let manager = AFHTTPRequestOperationManager()
        manager.responseSerializer = AFHTTPResponseSerializer()
        manager.responseSerializer.acceptableContentTypes = NSSet(object: "application/vnd.apple.pkpass") as Set<NSObject>
        let apiURL = API_URL + methodName
        print("apiURL \(apiURL)")
        
        // Add the authentication parameters
        var completeParametersDictionary = parametersDictionary
        if(completeParametersDictionary != nil && completeParametersDictionary![APIPostParam_PubKey] != nil && currentUser!.shopper != nil){
            // Get the current time
            let timeInterval:NSTimeInterval = NSDate().timeIntervalSince1970
            let time:Int = Int(timeInterval)
            
            // Build the Hash
            let shaString = currentUser!.shopper!.privateKey + "-" + currentUser!.shopper!.publicKey + "-" + "\(time)"
            let shaStringEncripted = shaString.SHA256
            
            // Set the authentication parameters
            completeParametersDictionary![APIPostParam_Hash] = shaStringEncripted()
            completeParametersDictionary![APIPostParam_Timestamp] = "\(time)"
            
            // Print the values
            print("auth param dictionary \(completeParametersDictionary!)")
        }
        
        manager.POST(apiURL,
                     parameters: completeParametersDictionary,
                     success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                        completionHandler(APICallResult.Response(responseObject))
            },
                     failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                        dLog("ERROR: " + error.description)
                        completionHandler(APICallResult.Error(error))
        })
    }
}