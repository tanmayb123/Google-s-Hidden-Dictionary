//
//  tDictionary.swift
//  dictionary
//
//  Created by Tanmay Bakshi on 2015-07-10.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import Foundation

class tDictionary {
    
    func findDefs(word: String) -> [String] {
        
        var url = "https://www.googleapis.com/scribe/v1/research?key=AIzaSyDqVYORLCUXxSv7zneerIgC2UYMnxvPeqQ&dataset=dictionary&dictionaryLanguage=en&query=\(word)"
        var jsonData = NSData()
        var json = NSDictionary()
        do {
            if let _ = NSURL(string: url) {
                if let _ = NSData(contentsOfURL: NSURL(string: url)!) {
                    jsonData = NSData(contentsOfURL: NSURL(string: url)!)!
                    json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                }
            }
        } catch {
            print(error)
        }
        if let _ = json["data"] {
            var data = json["data"] as! NSArray
            var data0 = data[0] as! NSDictionary
            var dict = data0["dictionary"] as! NSDictionary
            var defDat = dict["definitionData"] as! NSArray
            var defDat0 = defDat[0] as! NSDictionary
            var meanings = defDat0["meanings"] as! NSArray
            
            var finalMeans = [String]()
            for i in meanings {
                if let _ = i["meaning"] {
                    finalMeans.append(i["meaning"] as! String)
                }
            }
            
            return finalMeans
        }
        
        return []
        
    }
    
}