//
//  String+Time.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation

extension String {
    
    func timestampToString(withFormat format: String? = "YYYY-MM-dd HH:mm:ss", withToFormat toFormat: String? = "HH:mm") -> String {
        let dateInString = self
        
        let inDateFormatter = DateFormatter()
        inDateFormatter.timeZone = NSTimeZone.local
        inDateFormatter.dateFormat = format
        
        let dateIn = inDateFormatter.date(from: dateInString)
        
        let outDateFormatter = DateFormatter()
        outDateFormatter.timeZone = NSTimeZone.local
        outDateFormatter.dateFormat = toFormat
        
        guard let dateInput = dateIn else {
            return ""
        }
        
        let dateOutString = outDateFormatter.string(from: dateInput)
        return dateOutString
    }
}
