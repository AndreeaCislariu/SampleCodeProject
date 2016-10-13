//
//  TreatImage.swift
//  TreatTicket
//
//  Created by Andreea Jipa on 12/03/15.
//  Copyright (c) 2015 TreatTicket. All rights reserved.
//

import UIKit

class TreatImage {
    let filename:String
    let filenameSquare:String
    
    /*!
     * Custom initializer
     */
    init(filename:String, filenameSquare:String)
    {
        self.filename = filename
        self.filenameSquare = filenameSquare
    }
    
    /*!
     * Convenience Initializer which builds the object from a Dictionary
     */
    convenience init(dictionary:Dictionary<String, AnyObject>)
    {
        var filename = dictionary[APIParam_ImageFilename] as? String
        if(filename == nil){
            filename = ""
        }
        
        var filenameSquare = dictionary[APIParam_ImageSquare] as? String
        if(filenameSquare == nil){
            filenameSquare = ""
        }
        
        self.init(filename:filename!, filenameSquare:filenameSquare!)
    }
    
    /*!
     * Returns an instance of this object built with data from the given dictionary
     * \param dictionary The Dictionary object which contains Treat data
     * \returns TreatImage Optional object built with Dictionary data
     */
    class func treatImageWithDictionary(dictionary:Dictionary<String, AnyObject>) -> TreatImage?
    {
        if(!dictionary.isEmpty)
        {
            var filename = dictionary[APIParam_ImageFilename] as? String
            if(filename == nil){
                filename = ""
            }
            
            var filenameSquare = dictionary[APIParam_ImageSquare] as? String
            if(filenameSquare == nil){
                filenameSquare = ""
            }
            
            return TreatImage(filename:filename!, filenameSquare:filenameSquare!)
        }
        return nil
    }
    
    /*!
     * Returns an array with object instances of this object built with data from the given array with dictionary
     * \param array The Array with Dictionaries which contains Treat image data
     * \returns Array with TreatImage objects Optional object built with data from Array
     */
    class func treatImagesFromArray(array:Array<Dictionary<String, AnyObject>>) -> Array<TreatImage>?
    {
        if(!array.isEmpty)
        {
            var treatImagesArray:Array<TreatImage> = Array()
            for dictionary in array
            {
                if let treatImage = TreatImage.treatImageWithDictionary(dictionary){
                    treatImagesArray.append(treatImage)
                }
            }
            
            return treatImagesArray
        }
        
        return nil
    }
}
