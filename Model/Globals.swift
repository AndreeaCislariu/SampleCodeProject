//
//  Globals.swift
//  TreatTicket
//
//  Created by Andreea Jipa on 09/03/15.
//  Copyright (c) 2015 TreatTicket. All rights reserved.
//

import UIKit

/*!
 * Class used for encapsulating all the Global Settings from the API
 */
class Globals {
    let countriesArray:Array<Dictionary<String, AnyObject>>
    let citiesArray:Array<Dictionary<String, String>>
    let salutationsDictionary:Dictionary<String, String>
    let sectorsDictionary:Dictionary<String, String>
    let imageBaseURL:String
    let shareFBText:String
    let shareTWText:String
    let shareURLDaily:String?
    let shareURLProvider:String?
    
    /*!
     * Custom Initializer
     */
    init(countriesArray: Array<Dictionary<String, AnyObject>>, citiesArray:Array<Dictionary<String, String>>, salutationsDictionary: Dictionary<String, String>, sectorsDictionary: Dictionary<String, String>, imageBaseURL:String, shareFBText:String, shareTWText:String, shareURLDaily:String?, shareURLProvider:String?){
        self.countriesArray = countriesArray
        self.citiesArray = citiesArray
        self.salutationsDictionary = salutationsDictionary
        self.sectorsDictionary = sectorsDictionary
        self.imageBaseURL = imageBaseURL
        self.shareFBText = shareFBText
        self.shareTWText = shareTWText
        self.shareURLDaily = shareURLDaily
        self.shareURLProvider = shareURLProvider
    }
    
    /*!
     * Convenience Initializer which builds the object from a Dictionary
     */
    convenience init(dictionary:Dictionary<String, AnyObject>)
    {
        // Get the Countries Settings
        let countriesArray: Array<Dictionary<String, AnyObject>> = dictionary[APIParam_Countries] as! Array<Dictionary<String, AnyObject>>
        var citiesArray:Array<Dictionary<String, String>> = Array()
        for countryDictionary in countriesArray{
            if let cities = countryDictionary[APIParam_Cities] as? Array<Dictionary<String, AnyObject>>{
                for cityDictionary in cities{
                    let cityID = cityDictionary[APIParam_GlobalsCityID] as? String
                    let cityName = cityDictionary[APIParam_CityName] as? String
                    citiesArray.append([AppParam_CityID:cityID!, AppParam_CityName:cityName!])
                }
            }
        }
        
        let salutationsDictionary = dictionary[APIParam_Salutations] as? Dictionary<String, String>
        let sectorsDictionary = dictionary[APIParam_Sectors] as? Dictionary<String, String>
        let imageBaseURL = dictionary[APIParam_ImageBaseURL] as? String
        
        // Get the sharing settings
        var sharingFBText:String?
        var sharingTWText:String?
        if let shareTextsDictionary = dictionary[APIParam_Sharing] as? Dictionary<String, Dictionary<String,String>>{
            let language = NSLocale.preferredLanguages()[0]
            if let languageShareTextsDictionary = shareTextsDictionary[language]{
                sharingFBText = languageShareTextsDictionary[APIParam_SharingFacebook]
                sharingTWText = languageShareTextsDictionary[APIParam_SharingTwitter]
            }
            else if let languageShareTextsDictionary = shareTextsDictionary[DefaultSharingLanguage]{
                sharingFBText = languageShareTextsDictionary[APIParam_SharingFacebook]
                sharingTWText = languageShareTextsDictionary[APIParam_SharingTwitter]
            }
            
            // Set the default Sharing Text for Facebook
            if(sharingFBText == nil){
                sharingFBText = NSLocalizedString("ShareText", comment:"")
            }
            
            // Set the default Sharing Text for Twitter
            if(sharingTWText == nil){
                sharingTWText = NSLocalizedString("ShareText", comment:"")
            }
        }
        
        // Get the sharing URL settings
        var shareDailyURL:String?
        var shareProviderURL:String?
        if let shareURLsDictionary = dictionary[APIParam_SharingURLs] as? Dictionary<String,String>{
            if let dailyURL = shareURLsDictionary[TreatTypeKey.Daily.rawValue]{
                shareDailyURL = dailyURL
            }
            
            // TODO: Change to correct key once API returns it
            if let providerURL = shareURLsDictionary["provider"]{
                shareProviderURL = providerURL
            }
        }
        
        // Build the object
        self.init(countriesArray: countriesArray, citiesArray:citiesArray, salutationsDictionary: salutationsDictionary!, sectorsDictionary: sectorsDictionary!, imageBaseURL:imageBaseURL!, shareFBText:sharingFBText!, shareTWText:sharingTWText!, shareURLDaily:shareDailyURL, shareURLProvider:shareProviderURL)
    }
}
