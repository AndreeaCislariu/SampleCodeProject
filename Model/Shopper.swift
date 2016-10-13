//
//  Shopper.swift
//  TreatTicket
//
//  Created by AndreeaJipa on 08/03/15.
//  Copyright (c) 2015 TreatTicket. All rights reserved.
//

import Foundation

class Shopper {
    let id:String
    var publicKey:String
    var privateKey:String
    var email:String?
    var cityID:String?
    var salutationID:String?
    var forename:String?
    var surname:String?
    var address1:String?
    var address2:String?
    var town:String?
    var county:String?
    var postCode:String?
    var country:String?
    var phoneNumber:String?
    let dob:String?
    let gender:String?
    var availableCredits:String?
    
    /*!
     * Custom Initializer
     */
    init(id:String, publicKey:String, privateKey:String, email:String?, cityID:String?, salutationID:String?, forename:String?, surname:String?, address1:String?, address2:String?, town:String?, county:String?, postCode:String?, country:String?, phoneNumber:String?, dob:String?, gender:String?, availableCredits:String?)
    {
        self.id = id
        self.publicKey = publicKey
        self.privateKey = privateKey
        self.email = email
        self.cityID = cityID
        self.salutationID = salutationID
        self.forename = forename
        self.surname = surname
        self.address1 = address1
        self.address2 = address2
        self.town = town
        self.county = county
        self.postCode = postCode
        self.country = country
        self.phoneNumber = phoneNumber
        self.dob = dob
        self.gender = gender
        self.availableCredits = availableCredits
    }
    
    /*!
     * Convenience Initializer which builds the object from a Dictionary
     */
    convenience init(dictionary:Dictionary<String, AnyObject>)
    {
        // Get the object ID, required
        var id = dictionary[APIParam_Id] as? String
        if(id == nil)
        {
            if let idInt = dictionary[APIParam_Id] as? Int{
                id = "\(idInt)"
            }else{
                // Handle error
                ErrorHandler.handleError(ErrorType.ErrorString("Error: Model Shopper - Missing required parameter \(APIParam_Id)"))
            }
        }
        
        // Get the public key, required
        let publicKey = dictionary[APIParam_PublicKey] as? String
        if(publicKey == nil)
        {
            // Handle error
            ErrorHandler.handleError(ErrorType.ErrorString("Error: Model Shopper - Missing required parameter \(APIParam_PublicKey)"))
        }
        
        // Get the private key, required
        let privateKey = dictionary[APIParam_PrivateKey] as? String
        if(privateKey == nil)
        {
            // Handle error
            ErrorHandler.handleError(ErrorType.ErrorString("Error: Model Shopper - Missing required parameter \(APIParam_PrivateKey)"))
        }
        
        // Get the email, required
        let email = dictionary[APIParam_Email] as? String
        if(email == nil)
        {
            // Handle error
            ErrorHandler.handleError(ErrorType.ErrorString("Error: Model Shopper - Missing required parameter \(APIParam_Email)"))
        }
        
        let cityID = dictionary[APIParam_CityID] as? String
        let salutationID = dictionary[APIParam_SalutationID] as? String
        let forename = dictionary[APIParam_Forename] as? String
        let surname = dictionary[APIParam_Surname] as? String
        let address1 = dictionary[APIParam_Address1] as? String
        let address2 = dictionary[APIParam_Address2] as? String
        let town = dictionary[APIParam_Town] as? String
        let county = dictionary[APIParam_County] as? String
        let postCode = dictionary[APIParam_PostCode] as? String
        let country = dictionary[APIParam_Country] as? String
        let phoneNumber = dictionary[APIParam_PhoneNumber] as? String
        let dob = dictionary[APIParam_DOB] as? String
        let gender = dictionary[APIParam_Gender] as? String
        let availableCredits = dictionary[APIParam_AvailableCredits] as? String
        
        // Build the object
        self.init(id: id!, publicKey: publicKey!, privateKey: privateKey!, email: email, cityID: cityID, salutationID: salutationID, forename: forename, surname: surname, address1: address1, address2: address2, town: town, county: county, postCode: postCode, country: country, phoneNumber: phoneNumber, dob: dob, gender: gender, availableCredits: availableCredits)
        
    }
    
    /*!
     * Convenience Initializer which builds the object from a Dictionary
     */
    class func shopperWithDictionary(dictionary:Dictionary<String, AnyObject>) -> Shopper?
    {
        if(!dictionary.isEmpty)
        {
            // Get the the Shopper ID, required
            var id = dictionary[APIParam_Id] as? String
            if(id == nil)
            {
                if let idInt = dictionary[APIParam_Id] as? Int{
                    id = "\(idInt)"
                }else{
                    
                    // Handle error
                    ErrorHandler.handleError(ErrorType.ErrorString("Error: Model Shopper - Missing required parameter \(APIParam_Id)"))
                    return nil
                }
            }
            
            // Get the public key, required
            var publicKey = dictionary[APIParam_PublicKey] as? String
            if(publicKey == nil)
            {
                publicKey = ""
                // Handle error
                ErrorHandler.handleError(ErrorType.ErrorString("Error: Model Shopper - Missing required parameter \(APIParam_PublicKey)"))
                return nil
            }
            
            // Get the private key, required
            var privateKey = dictionary[APIParam_PrivateKey] as? String
            if(privateKey == nil)
            {
                privateKey = ""
                // Handle error
                ErrorHandler.handleError(ErrorType.ErrorString("Error: Model Shopper - Missing required parameter \(APIParam_PrivateKey)"))
                return nil
            }
            
            // Get the email, required
            let email = dictionary[APIParam_Email] as? String
            if(email == nil)
            {
                // Handle error
                ErrorHandler.handleError(ErrorType.ErrorString("Error: Model Shopper - Missing required parameter \(APIParam_Email)"))
                return nil
            }
            let cityID = dictionary[APIParam_CityID] as? String
            let salutationID = dictionary[APIParam_SalutationID] as? String
            let forename = dictionary[APIParam_Forename] as? String
            let surname = dictionary[APIParam_Surname] as? String
            let address1 = dictionary[APIParam_Address1] as? String
            let address2 = dictionary[APIParam_Address2] as? String
            let town = dictionary[APIParam_Town] as? String
            let county = dictionary[APIParam_County] as? String
            let postCode = dictionary[APIParam_PostCode] as? String
            let country = dictionary[APIParam_Country] as? String
            let phoneNumber = dictionary[APIParam_PhoneNumber] as? String
            let dob = dictionary[APIParam_DOB] as? String
            let gender = dictionary[APIParam_Gender] as? String
            let availableCredits = dictionary[APIParam_AvailableCredits] as? String
            
            // Build the object
            return Shopper(id: id!, publicKey: publicKey!, privateKey: privateKey!, email: email, cityID: cityID, salutationID: salutationID, forename: forename, surname: surname, address1: address1, address2: address2, town: town, county: county, postCode: postCode, country: country, phoneNumber: phoneNumber, dob: dob, gender: gender, availableCredits: availableCredits)
            
        }
        
        return nil
    }
    
    /*!
     * Method used to return a Dictionary with the current object data
     */
    func toDictionary()->Dictionary<String, AnyObject>
    {
        var shopperDictionary:Dictionary<String, AnyObject> = Dictionary()
        shopperDictionary[APIParam_Id] = self.id
        shopperDictionary[APIParam_PublicKey] = self.publicKey
        shopperDictionary[APIParam_PrivateKey] = self.privateKey
        shopperDictionary[APIParam_Email] = self.email
        shopperDictionary[APIParam_CityID] = self.cityID
        shopperDictionary[APIParam_SalutationID] = self.salutationID
        shopperDictionary[APIParam_Address1] = self.address1
        shopperDictionary[APIParam_Address2] = self.address2
        shopperDictionary[APIParam_Town] = self.town
        
        shopperDictionary[APIParam_County] = self.county
        shopperDictionary[APIParam_Forename] = self.forename
        shopperDictionary[APIParam_Surname] = self.surname
        shopperDictionary[APIParam_PostCode] = self.postCode
        shopperDictionary[APIParam_Country] = self.country
        shopperDictionary[APIParam_PhoneNumber] = self.phoneNumber
        shopperDictionary[APIParam_DOB] = self.dob
        shopperDictionary[APIParam_Gender] = self.gender
        shopperDictionary[APIParam_AvailableCredits] = self.availableCredits
        
        return shopperDictionary
    }
}

