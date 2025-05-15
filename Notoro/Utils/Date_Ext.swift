//
//  Date_Ext.swift
//  Notoro
//
//  Created by Raj Singh on 12/05/25.
//
import Foundation

let formatter = DateFormatter()
extension Date{
    
    
    
    var formate:String {
        formatter.dateFormat = "MMM d, yyyy" // Example: Feb 1, 2025
        formatter.locale = Locale(identifier: "en_US") // Ensures English month names
        
        let formattedDate = formatter.string(from: self)
        return formattedDate
    }
   
}
