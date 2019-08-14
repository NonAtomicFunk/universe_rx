//
//  Constants.swift
//  universe_rx
//
//  Created by  Alexander Berezovsky on 8/14/19.
//  Copyright © 2019 Me_Myself_i. All rights reserved.
//

import Foundation

lass Constants {
    
    let jsonUrl = "http://smartbox.software/tt/TT.json"
    
    let reddishOrange = #colorLiteral(red: 0.9529411765, green: 0.3490196078, blue: 0.05882352941, alpha: 1)
    let softBlue = #colorLiteral(red: 0.4039215686, green: 0.4470588235, blue: 0.8980392157, alpha: 1)
    let tomato = #colorLiteral(red: 0.9529411765, green: 0.3529411765, blue: 0.1411764706, alpha: 1)
    let green = #colorLiteral(red: 0.4784313725, green: 0.7098039216, blue: 0.2235294118, alpha: 1)
    
    let googleApiKey = "AIzaSyDUpfcsRGBXSHDCSCvwZoo4kdfvsKyN8P0"
}

enum SmrtBxTypes: String {
    case events = "event"
    case shops = "shop"
}

enum VCType: String {
    case map = "MapVC"
    case details = "DetailsVC"
}
