//
//  Provider.swift
//  TreatTicket
//
//  Created by Andreea Jipa on 12/03/15.
//  Copyright (c) 2015 TreatTicket. All rights reserved.
//

import UIKit

class Provider: NSObject {
    let providerName:String
    let latitude:NSString?
    let longitude:NSString?
    let contactAddress1:String?
    let contactAddress2:String?
    let contactTown:String?
    let contactPostCode:String?
    let contactPhone:String?
    let images:Array<TreatImage>?
    
    /*!
     * Custom initializer
     */
    init(providerName:String, latitude:String?, longitude:String?, contactAddress1:String?, contactAddress2:String?, contactTown:String?, contactPostCode:String?, contactPhone:String?, images:Array<TreatImage>?)
    {
        self.providerName = providerName
        self.latitude = latitude
        self.longitude = longitude
        self.contactAddress1 = contactAddress1
        self.contactAddress2 = contactAddress2
        self.contactTown = contactTown
        self.contactPostCode = contactPostCode
        self.contactPhone = contactPhone
        self.images = images
    }
    
    /*!
     * Convenience initializer which builds the object from a Dictionary
     */
    convenience init(dictionary:Dictionary<String, AnyObject>)
    {
        let providerName = dictionary[APIParam_ProviderName] as? String
        let latitude = dictionary[APIParam_Latitude] as? String
        let longitude = dictionary[APIParam_Longitude] as? String
        let contactAddress1 = dictionary[APIParam_ContactAddress1] as? String
        let contactAddress2 = dictionary[APIParam_ContactAddress2] as? String
        let contactTown = dictionary[APIParam_ContactTown] as? String
        let contactPostCode = dictionary[APIParam_ContactPostCode] as? String
        let contactPhone = dictionary[APIParam_ContactPhone] as? String
        
        var images:Array<TreatImage> = Array()
        if let imagesArray = dictionary[APIParam_Images] as? Array<Dictionary<String, AnyObject>>{
            images = TreatImage.treatImagesFromArray(imagesArray)!
        }
        self.init(providerName:providerName!, latitude:latitude, longitude:longitude, contactAddress1:contactAddress1, contactAddress2:contactAddress2, contactTown:contactTown, contactPostCode:contactPostCode, contactPhone:contactPhone, images:images)
    }
    
    /*!
     * Returns an instance of this object built with data from the given dictionary
     * \param dictionary The Dictionary object which contains Provider data
     * \returns Provider Optional object built with Dictionary data
     */
    class func providerWithDictionary(dictionary:Dictionary<String, AnyObject>) -> Provider?
    {
        if(!dictionary.isEmpty)
        {
            let providerName = dictionary[APIParam_ProviderName] as? String
            if(providerName == nil){
                return nil
            }
            
            let latitude = dictionary[APIParam_Latitude] as? NSString
            let longitude = dictionary[APIParam_Longitude] as? NSString
            let contactAddress1 = dictionary[APIParam_ContactAddress1] as? String
            let contactAddress2 = dictionary[APIParam_ContactAddress2] as? String
            let contactTown = dictionary[APIParam_ContactTown] as? String
            let contactPostCode = dictionary[APIParam_ContactPostCode] as? String
            let contactPhone = dictionary[APIParam_ContactPhone] as? String
            var images:Array<TreatImage> = Array()
            if let imagesArray = dictionary[APIParam_Images] as? Array<Dictionary<String, AnyObject>>{
                images = TreatImage.treatImagesFromArray(imagesArray)!
            }
            
            return Provider(providerName:providerName!, latitude:latitude! as String, longitude:longitude! as String, contactAddress1:contactAddress1!, contactAddress2:contactAddress2!, contactTown:contactTown!, contactPostCode:contactPostCode!, contactPhone:contactPhone!, images:images)
        }
        return nil
    }
    
    /*!
     * Gets the location information in a formatted string
     */
    func getLocationInformationString()->String{
        var locationInformationString = ""
        if(self.contactAddress1 != nil && self.contactAddress1?.isEmpty == false){
            locationInformationString += self.contactAddress1! + ", "
        }
        
        if(self.contactAddress2 != nil && self.contactAddress2?.isEmpty == false ){
            locationInformationString += self.contactAddress2! + ", "
        }
        
        if(self.contactTown != nil && self.contactTown?.isEmpty == false){
            locationInformationString += self.contactTown! + ", "
        }
        
        if(self.contactPostCode != nil && self.contactPostCode?.isEmpty == false){
            locationInformationString += self.contactPostCode! + ", "
        }
        
        if(self.contactPhone != nil && self.contactPhone?.isEmpty == false){
            locationInformationString += self.contactPhone!
        }
        
        return locationInformationString;
    }
}
