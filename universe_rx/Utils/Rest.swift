//
//  restService.swift
//  universe_rx
//
//  Created by Alexander Berezovsky on 8/14/19.
//  Copyright © 2019 Me_Myself_i. All rights reserved.
//

import UIKit
import Alamofire

final class Rest {
    static let singleTon = Rest()
    
    
    func getAll(_ completionHandler: @escaping ([DataModel]) -> Void) {
        
        let strUrl = Constants().jsonUrl
        let url = URL(string: strUrl)!
        
        Alamofire.request(url,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: nil).responseJSON { response in
                            let decoder = JSONDecoder()
                            
                            do {
                                
                                guard response.result.isSuccess else {
                                    completionHandler([])
                                    return
                                }
                                
                                let resultJSON = try JSONSerialization.data(withJSONObject: response.result.value,
                                                                            options: .prettyPrinted)
                                let encodedStr = String(data: resultJSON, encoding: .utf8)
                                let rawData = encodedStr?.data(using: .utf8)
                                
                                let resultz = try decoder.decode([DataModel].self,
                                                                 from: rawData!)
                                completionHandler(resultz)
                                
                            } catch(let error) {
                                print("Error in REST ", #function, error)
                            }
        }
    }
}


