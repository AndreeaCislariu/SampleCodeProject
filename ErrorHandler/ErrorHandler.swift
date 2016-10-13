//
//  ErrorHandler.swift
//  TreatTicket
//
//  Created by AndreeaJipa on 06/03/15.
//  Copyright (c) 2015 TreatTicket. All rights reserved.
//

import Foundation

/*!
 Errors Codes
 */
enum ErrorsCode: Int
{
    case BadFileDescriptor = 9
    case ConnectionResetByPeer = 54
    case OutOfBoundsError = 100
    case APIRequestMethodError = 101
    case SetReachabilityError = 102
    case LoginError = 103
    case NotAuthenticated = 104
    case JSONParseError = 105
    case NoInternetConnection = 106
    case JSONEncodeError = 107
    case APIResponseNotInCorrectFormat = 108
    case APICallsControllerError = 109
    case ObjectNotInExpectedFormat = 110
    case WriteToFileError = 111
    case ReverseGeocoderError = 150
    case DataGeocoderError = 151
    case Success = 200
    case MissingParameters = 400
    case NotAuthorized = 401
    case NotFound = 404
    case EmailAreadyRegistered = 409
    case TimeStampExpired = 498
    case ServerError = 500
    case UnknownError
}

/*!
 The list with error types
 */
enum ErrorType
{
    case Error(NSError)
    case ErrorCode(ErrorsCode)
    case ErrorAndCode(NSError, ErrorsCode)
    case ErrorString(String)
}

/*!
 This class handles errors of ErrorTypes
 */
class ErrorHandler{
    
    /*!
     * Method used to handle the ErrorType, it dispatches it to the appropriate method
     *
     * \param error The ErrorType object to be handled
     */
    class func handleError(error:ErrorType){
        switch(error){
        case .Error(let error):
            ErrorHandler.logErrorMessage(error.description)
            
        case .ErrorCode(let errorCode):
            ErrorHandler.handleErrorWithErrorCode(errorCode)
            
        case .ErrorAndCode(let error, let errorCode):
            ErrorHandler.handleErrorWithErrorAndCode(error, errorCode:errorCode)
            
        case .ErrorString(let errorString):
            ErrorHandler.logErrorMessage(errorString)
        }
    }
    
    /*!
     * Method used to handle an error message, it either displays it if the app is in Debug stage or logs it otherwise
     *
     * \param message The error message to be handled
     */
    class func handleErrorWithMessage(message:String){
        if(isInDebugStage){
            ErrorHandler.showErrorMessage(message);
        }
        else{
            ErrorHandler.logErrorMessage(message)
        }
    }
    
    /*!
     * Method used to handle an error with an ErrorsCode
     *
     * \param errorCode The error code to be handled
     */
    class func handleErrorWithErrorCode(errorCode:ErrorsCode){
        switch (errorCode){
        case .BadFileDescriptor:
             if(isInDebugStage){
                ErrorHandler.logErrorMessage("BadFileDescriptor Error");
             }
             else{
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:""))
            }
            
        case .ConnectionResetByPeer:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage("ConnectionResetByPeer Error");
            }
            else{
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:""))
            }
            
        case .OutOfBoundsError:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage("OutOfBounds Error");
            }
            else{
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:""))
            }
            
        case .APIRequestMethodError:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage("API Request Error");
            }
            else{
                ErrorHandler.logErrorMessage("API Request Error");
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:""))
            }
            
        case .SetReachabilityError:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage("Reachability Error");
            }
            else{
                ErrorHandler.logErrorMessage("Reachability Error");
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:""))
            }
            
        case .LoginError:
            ErrorHandler.logErrorMessage("Error on login");
            ErrorHandler.showErrorMessage(NSLocalizedString("Login_Failed", comment:""))
            
        case .NotAuthenticated:
            ErrorHandler.showErrorMessage(NSLocalizedString("Error_NotAuthenticated", comment:""))
            
        case .JSONParseError:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage("Error on parsing JSON");
            }
            else{
                ErrorHandler.logErrorMessage("Error on parsing JSON");
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:""))
            }
            
        case .NoInternetConnection:
            ErrorHandler.showErrorMessage(NSLocalizedString("Error_NoInternetConnection", comment:""))
            
        case .JSONEncodeError:
            if(isInDebugStage){
                ErrorHandler.showErrorMessage("JSON encode error")
            }
            else{
                ErrorHandler.logErrorMessage("JSON encode error")
                ErrorHandler.showErrorMessage(NSLocalizedString("APICall_Failed", comment:""))
            }
            
        case .APIResponseNotInCorrectFormat:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage("APICall_ResponseNotInCorrectFormat")
            }
            else{
                ErrorHandler.logErrorMessage("APICall_ResponseNotInCorrectFormat")
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:""))
            }
            
        case .APICallsControllerError:
            if(isInDebugStage){
                ErrorHandler.showErrorMessage("API call controller exception")
            }
            else{
                
                ErrorHandler.logErrorMessage("API call controller exception")
                ErrorHandler.showErrorMessage(NSLocalizedString("APICall_Failed", comment:""))
            }
            
        case .ObjectNotInExpectedFormat:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage(NSLocalizedString("APICall_ObjectNotInExpectedFormat", comment:""))
            }
            else{
                ErrorHandler.logErrorMessage(NSLocalizedString("APICall_ObjectNotInExpectedFormat", comment:""))
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:""))
            }
            
        case .WriteToFileError:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage(NSLocalizedString("Error_WriteToFile", comment:""))
            }
            else{
                ErrorHandler.logErrorMessage(NSLocalizedString("Error_WriteToFile", comment:""))
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:""))
            }
            
        case .ReverseGeocoderError:
            ErrorHandler.logErrorMessage(NSLocalizedString("Error_Geocode", comment:""))
            
        case .DataGeocoderError:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage(NSLocalizedString("Error_GeocodeData", comment:""))
            }
            else{
                ErrorHandler.logErrorMessage(NSLocalizedString("Error_Geocode", comment:""))
            }
            
        case .MissingParameters:
            ErrorHandler.logErrorMessage(NSLocalizedString("Error_WrongParameters", comment:""))
            
        case .NotAuthorized:
            ErrorHandler.logErrorMessage(NSLocalizedString("Error_NotAuthorized", comment:""))
            
        case .NotFound:
            ErrorHandler.logErrorMessage(NSLocalizedString("Error_Unknown", comment:""))
            
        case .EmailAreadyRegistered:
            ErrorHandler.logErrorMessage(NSLocalizedString("Register_EmailAlreadyUsed", comment:""))
            
        case .ServerError:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage(NSLocalizedString("Error_ServerError", comment:""))
            }
            else{
                ErrorHandler.logErrorMessage(NSLocalizedString("Error_ServerError", comment:""))
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:""))
            }
            
        case .UnknownError:
            ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:""))
            
        default:
            print("")
        }
    }
    
    /*!
     * Method used to handle an NSError with an error code from ErrorsCode list
     *
     * \param error The error object to be handled
     * \param errorCode The error code to be handled
     */
    class func handleErrorWithErrorAndCode(error:NSError, errorCode:ErrorsCode){
        switch (errorCode){
        case .BadFileDescriptor:
             if(isInDebugStage){
                ErrorHandler.logErrorMessage("BadFileDescriptor Error" + error.description);
             }
             else{
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:"") + error.description)
            }
            
        case .ConnectionResetByPeer:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage("ConnectionResetByPeer Error");
            }
            else{
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:""))
            }
            
        case .OutOfBoundsError:
            print("")
            if(isInDebugStage){
                ErrorHandler.logErrorMessage("OutOfBounds Error " + error.description);
            }
            else{
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:"") + error.description)
            }
            
        case .APIRequestMethodError:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage("API Request Error " + error.description);
            }
            else{
                ErrorHandler.logErrorMessage("API Request Error " + error.description);
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:"") + error.description)
            }
            
        case .SetReachabilityError:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage("Reachability Error " + error.description);
            }
            else{
                ErrorHandler.logErrorMessage("Reachability Error" + error.description);
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:"") + error.description)
            }
            
        case .LoginError:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage("Error on login " + error.description);
            }
            else
            {
                ErrorHandler.logErrorMessage("Error on login " + error.description);
                ErrorHandler.showErrorMessage(NSLocalizedString("Login_Failed", comment:"") + error.description)
            }
            
        case .NotAuthenticated:
            ErrorHandler.showErrorMessage(NSLocalizedString("Error_NotAuthenticated", comment:"") + error.description)
            print("")
            
        case .JSONParseError:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage("Error on parsing JSON " + error.description);
            }
            else{
                ErrorHandler.logErrorMessage("Error on parsing JSON " + error.description);
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:"") + error.description)
            }
            
        case .NoInternetConnection:
            ErrorHandler.showErrorMessage(NSLocalizedString("Error_NoInternetConnection", comment:"") + error.description)
            
        case .JSONEncodeError:
            if(isInDebugStage){
                ErrorHandler.showErrorMessage("JSON encode error " + error.description)
            }
            else{
                ErrorHandler.logErrorMessage("JSON encode error " + error.description)
                ErrorHandler.showErrorMessage(NSLocalizedString("APICall_Failed", comment:"") + error.description)
            }
            
        case .APIResponseNotInCorrectFormat:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage("APICall_ResponseNotInCorrectFormat" + error.description)
            }
            else{
                ErrorHandler.logErrorMessage("APICall_ResponseNotInCorrectFormat" + error.description)
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:"") + error.description)
            }
            
        case .APICallsControllerError:
            if(isInDebugStage){
                ErrorHandler.showErrorMessage("API call controller exception " + error.description)
            }
            else{
                
                ErrorHandler.logErrorMessage("API call controller exception " + error.description)
                ErrorHandler.showErrorMessage(NSLocalizedString("APICall_Failed", comment:"") + error.description)
            }
            
        case .ObjectNotInExpectedFormat:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage(NSLocalizedString("APICall_ObjectNotInExpectedFormat", comment:"") + error.description)
            }
            else{
                ErrorHandler.logErrorMessage(NSLocalizedString("APICall_ObjectNotInExpectedFormat", comment:"") + error.description)
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:"") + error.description)
            }
            
        case .WriteToFileError:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage(NSLocalizedString("Error_WriteToFile", comment:"") + error.description)
            }
            else{
                ErrorHandler.logErrorMessage(NSLocalizedString("Error_WriteToFile", comment:"") + error.description)
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:"") + error.description)
            }
            
        case .ReverseGeocoderError:
            ErrorHandler.logErrorMessage(NSLocalizedString("Error_Geocode", comment:"") + error.description)
            
        case .DataGeocoderError:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage(NSLocalizedString("Error_GeocodeData", comment:"") + error.description)
            }
            else{
                ErrorHandler.logErrorMessage(NSLocalizedString("Error_Geocode", comment:"") + error.description)
            }
            
        case .Success:
            print("")
            
        case .MissingParameters:
            ErrorHandler.logErrorMessage(NSLocalizedString("Error_WrongParameters", comment:"") + error.description)
            
        case .NotAuthorized:
            ErrorHandler.logErrorMessage(NSLocalizedString("Error_NotAuthorized", comment:"") + error.description)
            
        case .NotFound:
            ErrorHandler.logErrorMessage(NSLocalizedString("Error_Unknown", comment:"") + error.description)
            
        case .ServerError:
            if(isInDebugStage){
                ErrorHandler.logErrorMessage(NSLocalizedString("Error_ServerError", comment:"") + error.description)
            }
            else{
                ErrorHandler.logErrorMessage(NSLocalizedString("Error_ServerError", comment:"") + error.description)
                ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:"") + error.description)
            }
            
        case .UnknownError:
            ErrorHandler.showErrorMessage(NSLocalizedString("Error_Unknown", comment:"") + error.description)
            
        default:
            print("")
        }
    }
    
    /*!
     * Method used to show an error message
     *
     * \param message The error message to be displayed
     */
    class func showErrorMessage(message:String){
        ErrorHandler.logErrorMessage(message)
        
        dispatch_async(dispatch_get_main_queue(), {
            let alert = UIAlertView()
            alert.title = "Error"
            alert.message = message
            alert.addButtonWithTitle("Ok")
            alert.show()
        })
    }
    
    /*!
     * Method used to log an error message
     *
     * \param message The error message to be logged
     */
    class func logErrorMessage(message:String){
        print("Error: " + message)
    }
}