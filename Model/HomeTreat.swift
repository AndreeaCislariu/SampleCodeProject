//
//  HomeTreat.swift
//  TreatTicket
//
//  Created by AndreeaJipa on 07/03/15.
//  Copyright (c) 2015 TreatTicket. All rights reserved.
//

import Foundation

class HomeTreat
{
    let id:String
    let categoryID:String
    let title:String
    let imageURL:String
    let originalPrice:String
    let discountedPrice:String
    let providerName:String
    
    /*!
     * Custom Initializer
     */
    init(id:String, categoryID:String, title:String, imageURL:String, originalPrice:String, discountedPrice:String, providerName:String)
    {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.originalPrice = originalPrice
        self.discountedPrice = discountedPrice
        self.categoryID = categoryID
        self.providerName = providerName
    }
    
    /*!
     * Convenience Initializer which builds the object from a Dictionary
     */
    convenience init(dictionary:Dictionary<String, AnyObject>)
    {
        // Get the object ID, required
        let id = dictionary[APIParam_Id] as? String
        if(id == nil){
            // Handle error
            ErrorHandler.handleError(ErrorType.ErrorString("Error: Model HomeTreat - Missing required parameter \(APIParam_Id)"))
        }
        
        // Get the title, required
        var title = dictionary[APIParam_TitleApp] as? String
        if(title == nil){
            title = dictionary[APIParam_Title] as? String
            if(title == nil){
                // Handle error
                ErrorHandler.handleError(ErrorType.ErrorString("Error: Model HomeTreat - Missing required parameter \(APIParam_Id)"))
            }
        }
        
        // Get the price information
        var originalPrice:String = ""
        var discountedPrice:String = ""
        if let variations = dictionary[APIParam_Variations] as? Array<Dictionary<String, AnyObject>>
        {
            if(variations.count > 0)
            {
                let variation = variations[0]
                originalPrice = variation[APIParam_OriginalPrice] as! String
                discountedPrice = variation[APIParam_DiscountedPrice] as! String
            }
        }
        
        // Get the image URL
        var imageURL = ""
        if let images = dictionary[APIParam_Images] as? Array<Dictionary<String, AnyObject>>
        {
            if(images.count > 0)
            {
                let image = images[0]
                imageURL = image[APIParam_ImageSquare] as! String
            }
        }
        
        // Get the provider image URL
        if imageURL == ""{
            if let providerImageDictionary = dictionary[APIParam_ProviderImage] as? Dictionary<String, AnyObject>
            {
                if let providerImageURL = providerImageDictionary[APIParam_ImageSquare] as? String
                {
                    imageURL = providerImageURL
                }
            }
        }
        
        // Get the category ID, required
        let categoryID = dictionary[APIParam_CategoryID] as? String
        if(categoryID == nil){
            // Handle error
            ErrorHandler.handleError(ErrorType.ErrorString("Error: Model HomeTreat - Missing required parameter \(APIParam_Id)"))
        }
        
        // Get the provider name
        var providerName = ""
        if let provider = dictionary[APIParam_TreatProvider] as? Dictionary<String, AnyObject>
        {
            providerName = provider[APIParam_ProviderName] as! String
        }
        
        // Build the object
        self.init(id: id!, categoryID: categoryID!, title: title!, imageURL: imageURL, originalPrice: originalPrice, discountedPrice: discountedPrice, providerName: providerName)
    }
    
    /*!
     * Returns an instance of this object built with data from the given dictionary
     * \param dictionary The Dictionary object which contains Treat data
     * \returns HomeTreat Optional object built with Dictionary data
     */
    class func homeTreatWithDictionary(dictionary:Dictionary<String, AnyObject>) -> HomeTreat?
    {
        if(!dictionary.isEmpty)
        {
            // Get the object ID, required
            let id = dictionary[APIParam_Id] as? String
            if(id == nil){
                // Handle error
                ErrorHandler.handleError(ErrorType.ErrorString("Error: Model HomeTreat - Missing required parameter \(APIParam_Id)"))
                return nil
            }
            
            // Get the title, required
            var title = dictionary[APIParam_TitleApp] as? String
            if(title == nil){
                title = dictionary[APIParam_Title] as? String
                if(title == nil){
                    // Handle error
                    ErrorHandler.handleError(ErrorType.ErrorString("Error: Model HomeTreat - Missing required parameter \(APIParam_Id)"))
                    return nil
                }
            }

            // Get the price information
            var originalPrice:String = ""
            var discountedPrice:String = ""
            if let variations = dictionary[APIParam_Variations] as? Array<Dictionary<String, AnyObject>>
            {
                if(variations.count > 0)
                {
                    let variation = variations[0]
                    originalPrice = variation[APIParam_OriginalPrice] as! String
                    discountedPrice = variation[APIParam_DiscountedPrice] as! String
                }
            }
            
            // Get the image URL
            var imageURL = ""
            if let images = dictionary[APIParam_Images] as? Array<Dictionary<String, AnyObject>>
            {
                if(images.count > 0)
                {
                    let image = images[0]
                    imageURL = image[APIParam_ImageSquare] as! String
                }
            }
            
            // Get the provider image URL
            if imageURL == ""{
                if let providerImageDictionary = dictionary[APIParam_ProviderImage] as? Dictionary<String, AnyObject>
                {
                    if let providerImageURL = providerImageDictionary[APIParam_ImageSquare] as? String
                    {
                        imageURL = providerImageURL
                    }
                }
            }
            
            // Get the category ID, required
            let categoryID = dictionary[APIParam_CategoryID] as? String
            if(categoryID == nil){
                // Handle error
                ErrorHandler.handleError(ErrorType.ErrorString("Error: Model HomeTreat - Missing required parameter \(APIParam_Id)"))
                return nil
            }
            
            // Get the provider name
            var providerName = ""
            if let provider = dictionary[APIParam_TreatProvider] as? Dictionary<String, AnyObject>
            {
                providerName = provider[APIParam_ProviderName] as! String
            }
            
            // Build the object
            return HomeTreat(id: id!, categoryID: categoryID!, title: title!, imageURL: imageURL, originalPrice: originalPrice, discountedPrice: discountedPrice, providerName:providerName)
        }
        
        return nil
    }
    
    /*!
     * Returns an array with object instances of this object built with data from the given array with dictionary
     * \param array The Array with Dictionaries which contains HomeTreat data
     * \returns Array with HomeTreat objects Optional object built with data from Array
     */
    class func homeTreatsFromArray(array:Array<Dictionary<String, AnyObject>>) -> Array<HomeTreat>?
    {
        if(!array.isEmpty)
        {
            var treatOptionsArray:Array<HomeTreat> = Array()
            for dictionary in array
            {
                if let homeArray = HomeTreat.homeTreatWithDictionary(dictionary)
                {
                    treatOptionsArray.append(homeArray)
                }
            }
            
            return treatOptionsArray
        }
        
        return nil
    }
}

