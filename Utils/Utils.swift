//
//  Utils.swift
//  TreatTicket
//
//  Created by AndreeaJipa on 08/03/15.
//  Copyright (c) 2015 TreatTicket. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    class func imageWithImage(image:UIImage, toWidth:CGFloat) -> UIImage{
        let ratio = image.size.width / toWidth
        let height = image.size.height / ratio
        let size:CGSize = CGSizeMake(toWidth, height)
        
        UIGraphicsBeginImageContext(size)
        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImage;
    }
    
    class func heightForImageWidth(image:UIImage, toWidth:CGFloat) -> CGFloat{
        let ratio = image.size.width / toWidth
        let height = image.size.height / ratio
        return height;
    }
    
    class func imageHeightConstrainedWidth(size:CGSize, toWidth:CGFloat) -> CGFloat{
        let ratio = size.width / toWidth
        let height = size.height / ratio
        return height;
    }
    
    class func heightForString(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
    }
    
    class func widthForString(text:String, font:UIFont, height:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, CGFloat.max, height))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        return label.frame.width
    }
    
    class func saveDataToDocumentsDirectory(fileData:NSData, path:String, subdirectory:String?) -> String?
    {
        // Remove unnecessary slash if need
        let newPath = self.stripSlashIfNeeded(path)
        var newSubdirectory:String?
        if (subdirectory != nil) {
            newSubdirectory = self.stripSlashIfNeeded(subdirectory!)
        }
        // Create generic beginning to file save path
        var savePath = self.applicationDocumentsDirectory().path!+"/"
        
        if (newSubdirectory != nil) {
            savePath += newSubdirectory!
            self.createSubDirectory(savePath)
            savePath += "/"
        }
        
        // Add requested save path
        savePath += newPath
        
        print(savePath)
        // Save the file and see if it was successful
        let ok:Bool = NSFileManager.defaultManager().createFileAtPath(savePath,contents:fileData, attributes:nil)
        
        // Return status of file save
        if(ok){
            return savePath;
        }
        return nil;
    }
    
    class func deletePDFDirectory() -> Bool
    {
        // Remove unnecessary slash if need
        
        // Create generic beginning to file delete path
        let deletePath = self.applicationDocumentsDirectory().path!+"/PDF"
        
        // Delete the file and see if it was successful
        var error:NSError?
        var ok:Bool
        do {
            try NSFileManager.defaultManager().removeItemAtPath(deletePath)
            ok = true
        } catch let error1 as NSError {
            error = error1
            ok = false
        }
        
        if error != nil {
            print(error)
        }
        // Return status of file save
        return ok;
    }
    
    //directories
    class func applicationDocumentsDirectory() -> NSURL {
        
        var documentsDirectory:String?
        var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true);
        if paths.count > 0 {
            if let pathString = paths[0] as? NSString {
                documentsDirectory = pathString as String
            }
        }
        
        return NSURL(string:documentsDirectory!)!
    }
    
    class func stripSlashIfNeeded(stringWithPossibleSlash:String) -> String {
        var stringWithoutSlash:String = stringWithPossibleSlash
        // If the file name contains a slash at the beginning then we remove so that we don't end up with two
        if stringWithPossibleSlash.hasPrefix("/") {
            stringWithoutSlash = stringWithPossibleSlash.substringFromIndex(stringWithoutSlash.startIndex.advancedBy(1))
        }
        // Return the string with no slash at the beginning
        return stringWithoutSlash
    }
    
    class func createSubDirectory(subdirectoryPath:String) -> Bool {
        var isDir:ObjCBool=false;
        let exists:Bool = NSFileManager.defaultManager().fileExistsAtPath(subdirectoryPath as String, isDirectory:&isDir)
        if (exists) {
            /* a file of the same name exists, we don't care about this so won't do anything */
            if isDir {
                /* subdirectory already exists, don't create it again */
                return true;
            }
        }
        do{
            try NSFileManager.defaultManager().createDirectoryAtPath(subdirectoryPath, withIntermediateDirectories: true, attributes: nil)
            return true;
        }catch{
            print("Error when trying to create the subdirectory path \(subdirectoryPath)")
        }
        
        return false;
    }
    
    
    class func getGradientView(size:CGSize, startColor:UIColor, endColor:UIColor) -> UIView{
        // Create the gradient view
        let view = UIView(frame: CGRectMake(0, 0, size.width, size.height))
        view.backgroundColor = UIColor.clearColor()
        
        // Add gradient effect
        let rect : CGRect = CGRectMake(0, 0, size.width, size.height)
        let vista : UIView = UIView(frame: rect)
        let gradient : CAGradientLayer = CAGradientLayer()
        gradient.frame = vista.bounds
        let arrayColors = [startColor, endColor]
        
        gradient.colors = arrayColors
        view.layer.insertSublayer(gradient, atIndex: 0)
        return view;
    }
    
    class func dataToHex(data: NSData) -> NSString? {
        let buf = UnsafePointer<UInt8>(data.bytes)
        let charA = UInt8(UnicodeScalar("a").value)
        let char0 = UInt8(UnicodeScalar("0").value)
        
        func itoh(value: UInt8) -> UInt8 {
            return (value > 9) ? (charA + value - 10) : (char0 + value)
        }
        
        let ptr = UnsafeMutablePointer<UInt8>.alloc(data.length * 2)
        
        for i in 0 ..< data.length {
            ptr[i*2] = itoh((buf[i] >> 4) & 0xF)
            ptr[i*2+1] = itoh(buf[i] & 0xF)
        }
        
        return NSString(bytesNoCopy: ptr, length: data.length*2, encoding: NSUTF8StringEncoding, freeWhenDone: true)
    }
    
    class func hexToData(str: NSString) -> NSData {
        let len = str.length/2
        let data = NSMutableData(capacity:len)!
        let ptr = str.cStringUsingEncoding(NSUTF8StringEncoding)
        
        for var i=0; i<len; ++i {
            var num: UInt8 = 0
            var multi: UInt8 = 16;
            for var j=0; j<2; ++j {
                let c: UInt8 = UInt8(ptr[i*2+j])
                var offset: UInt8 = 0
                
                switch c {
                case 48...57:   // '0'-'9'
                    offset = 48
                case 65...70:   // 'A'-'F'
                    offset = 65 - 10         // 10 since 'A' is 10, not 0
                case 97...102:  // 'a'-'f'
                    offset = 97 - 10         // 10 since 'a' is 10, not 0
                default:
                    assert(false)
                }
                
                num += (c - offset)*multi
                multi = 1
            }
            data.appendBytes(&num, length:1)
        }
        return data;
    }

}
