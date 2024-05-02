//
//  HelperK.swift
//  Karam
//
//  Created by Ghoost on 1/25/20.
//  Copyright © 2020 Khalij. All rights reserved.
//

import UIKit

class HelperK: NSObject {
    
    class func openWeb(url: String?) {
        guard let appURL = URL(string: url ?? "")else{return}
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            guard  let webURL = URL(string: url ?? "")else{return}
            application.open(webURL)
        }
    }
}
    
