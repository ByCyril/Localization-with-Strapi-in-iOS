//
//  String+Extension.swift
//  HelloStrapi
//
//  Created by Cyril Garcia on 5/24/21.
//

import Foundation

extension String {
    
    func toDate() -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        guard let date = formatter.date(from: self) else { return "Undefined Date" }
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.autoupdatingCurrent
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        return dateFormatter.string(from: date)
    }
}
