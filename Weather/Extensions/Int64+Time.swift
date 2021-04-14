//
//  Int64+Time.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation

extension Int64 {
    
    func timestampToString(withFormat format: String? = "EEEE, MMM d") -> String {
        let date = Date(timeIntervalSince1970: Double(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
}
