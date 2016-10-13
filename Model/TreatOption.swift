//
//  TreatOption.swift
//  TreatTicket
//
//  Created by AndreeaJipa on 07/03/15.
//  Copyright (c) 2015 TreatTicket. All rights reserved.
//

import Foundation

enum TreatOptionStatus:Int {
    case Available = 1
    case SellingFast = 2
    case SoldOut = 3
}

class TreatOption
{
    let id:String
    let treatID:String
    let title:String
    let purchaseLimit:String?
    let purchaseCount:String?
    let originalPrice:String
    let discountedPrice:String
    let pAndPPrice:String?
    let status:TreatOptionStatus
    
    /*!
     * Custom Initializer
     */
    init(id:String, treatID:String, title:String, purchaseLimit:String, purchaseCount:String, originalPrice:String, discountedPrice:String, pAndPPrice:String, status:TreatOptionStatus)
    {
        self.id = id
        self.treatID = treatID
        self.title = title
        self.purchaseLimit = purchaseLimit
        self.purchaseCount = purchaseCount
        self.originalPrice = originalPrice
        self.discountedPrice = discountedPrice
        self.pAndPPrice = pAndPPrice
        self.status = status
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
            ErrorHandler.handleError(ErrorType.ErrorString("Error: Model TreatOption - Missing required parameter \(APIParam_Id)"))
        }
        
        // Get the treat ID, required
        let treatID = dictionary[APIParam_TreatId] as? String
        if(treatID == nil){
            // Handle error
            ErrorHandler.handleError(ErrorType.ErrorString("Error: Model TreatOption - Missing required parameter \(APIParam_TreatId)"))
        }
        
        // Get the title, required
        var title = dictionary[APIParam_TitleApp] as? String
        if(title == nil){
            title = dictionary[APIParam_Title] as? String
            if(title == nil){
                // Handle error
                ErrorHandler.handleError(ErrorType.ErrorString("Error: Model TreatOption - Missing required parameter \(APIParam_Title)"))
            }
        }
        
        let purchaseLimit = dictionary[APIParam_PurchaseLimit] as? String
        let purchaseCount = dictionary[APIParam_PurchaseCount] as? String
        
        // Get the original price, required
        let originalPrice = dictionary[APIParam_OriginalPrice] as? String
        if(originalPrice == nil){
            // Handle error
            ErrorHandler.handleError(ErrorType.ErrorString("Error: Model TreatOption - Missing required parameter \(APIParam_OriginalPrice)"))
        }
        
        // Get the discounted price, required
        let discountedPrice = dictionary[APIParam_DiscountedPrice] as? String
        if(discountedPrice == nil){
            // Handle error
            ErrorHandler.handleError(ErrorType.ErrorString("Error: Model TreatOption - Missing required parameter \(APIParam_DiscountedPrice)"))
        }
        
        // Set the treat status
        let pAndPPrice = dictionary[APIParam_PAndPPrice] as? String
        let status = dictionary[APIParam_Status] as? String
        var treatOptionStatus = TreatOptionStatus.Available
        if(Int((status)!) == TreatOptionStatus.SellingFast.rawValue)
        {
            treatOptionStatus = TreatOptionStatus.SellingFast
        }
        else if(Int((status)!) == TreatOptionStatus.SoldOut.rawValue)
        {
            treatOptionStatus = TreatOptionStatus.SoldOut
        }
        
        // Build the object
        self.init(id:id!, treatID:treatID!, title:title!, purchaseLimit:purchaseLimit!, purchaseCount:purchaseCount!, originalPrice:originalPrice!, discountedPrice:discountedPrice!, pAndPPrice:pAndPPrice!, status:treatOptionStatus)
    }
    
    /*!
     * Returns an instance of this object built with data from the given dictionary
     * \param dictionary The Dictionary object which contains Treat data
     * \returns TreatOption Optional object built with Dictionary data
     */
    class func treatOptionWithDictionary(dictionary:Dictionary<String, AnyObject>) -> TreatOption?
    {
        if(!dictionary.isEmpty)
        {
            // Get the object ID, required
            let id = dictionary[APIParam_Id] as? String
            if(id == nil){
                // Handle error
                ErrorHandler.handleError(ErrorType.ErrorString("Error: Model TreatOption - Missing required parameter \(APIParam_Id)"))
                return nil
            }
            
            // Get the treat ID, required
            let treatID = dictionary[APIParam_TreatId] as? String
            if(treatID == nil){
                // Handle error
                ErrorHandler.handleError(ErrorType.ErrorString("Error: Model TreatOption - Missing required parameter \(APIParam_TreatId)"))
                return nil
            }
            
            // Get the treat title , required
            var title = dictionary[APIParam_TitleApp] as? String
            if(title == nil){
                title = dictionary[APIParam_Title] as? String
                if(title == nil){
                    // Handle error
                    ErrorHandler.handleError(ErrorType.ErrorString("Error: Model TreatOption - Missing required parameter \(APIParam_Title)"))
                    return nil
                }
            }
            
            // Set the purchase limits
            let purchaseLimit = dictionary[APIParam_PurchaseLimit] as? String
            let purchaseCount = dictionary[APIParam_PurchaseCount] as? String
            
            // Set the price details
            let originalPrice = dictionary[APIParam_OriginalPrice] as? String
            if(originalPrice == nil){
                return nil
            }
            let discountedPrice = dictionary[APIParam_DiscountedPrice] as? String
            if(discountedPrice == nil){
                return nil
            }
            let pAndPPrice = dictionary[APIParam_PAndPPrice] as? String
            
            // Set the status
            let status = dictionary[APIParam_Status] as? String
            var treatOptionStatus = TreatOptionStatus.Available
            if(Int((status)!) == TreatOptionStatus.SellingFast.rawValue)
            {
                treatOptionStatus = TreatOptionStatus.SellingFast
            }
            else if(Int((status)!) == TreatOptionStatus.SoldOut.rawValue)
            {
                treatOptionStatus = TreatOptionStatus.SoldOut
            }
            
            // Build the object
            return TreatOption(id:id!, treatID:treatID!, title:title!, purchaseLimit:purchaseLimit!, purchaseCount:purchaseCount!, originalPrice:originalPrice!, discountedPrice:discountedPrice!, pAndPPrice:pAndPPrice!, status:treatOptionStatus)
        }
        
        return nil
    }
    
    /*!
     * Returns an array with object instances of this object built with data from the given array with dictionary
     * \param array The Array with Dictionaries which contains Treat data
     * \returns Array with TreatOption objects Optional object built with data from Array
     */
    class func treatOptionsFromArray(array:Array<Dictionary<String, AnyObject>>) -> Array<TreatOption>?
    {
        if(!array.isEmpty)
        {
            var treatOptionsArray:Array<TreatOption> = Array()
            for dictionary in array
            {
                if let treatOption = TreatOption.treatOptionWithDictionary(dictionary){
                    treatOptionsArray.append(treatOption)
                }
            }
            
            return treatOptionsArray
        }
        
        return nil
    }
}

