//
//  EnglishModel.swift
//  USNaturalizationDemo
//
//  Created by Juan Gallo on 25/4/22.
//

import Foundation

class EnglishModel {
    
    
    func getPlist(withName name:String) -> [String:Any]?
    {
        let path = Bundle.main.path(forResource: name, ofType: "plist")!
        let xml = FileManager.default.contents(atPath: path)
        
        return (try? PropertyListSerialization.propertyList(from: xml!, options: .mutableContainersAndLeaves, format: nil)) as? [String:Any]
    
    }
   
    
}
