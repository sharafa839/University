//
//  Extensions.swift
//  University
//
//  Created by Sharaf on 5/1/24.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }
}

extension UIViewController {
    func showActivityIndicator() {
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}

extension String {
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        if let date = dateFormatter.date(from: self) {
            let calendar = Calendar.current
            let launchYear = calendar.component(.year, from: date)
            let currentYear = calendar.component(.year, from: Date())
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "dd MMMM yyyy, "
            if launchYear == currentYear {
                dateFormatter.dateFormat = "dd MMMM, "
            }
            if !timeIs24HourFormat() {
                dateFormatter.dateFormat += "h:mm a"
            } else {
                dateFormatter.dateFormat += "HH:mm"
            }
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        } else {
            print("There was an error decoding the string")
            return ""
        }
    }
    
    func timeIs24HourFormat() -> Bool {
        let locale = NSLocale.current
        let formatter: String = DateFormatter.dateFormat(fromTemplate: "j", options:0, locale:locale)!
        if formatter.contains("a") {
            return false
        } else {
            return true
        }
    }
}
