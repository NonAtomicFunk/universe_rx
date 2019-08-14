//
//  BaseVM.swift
//  universe_rx
//
//  Created by Alexander Berezovsky on 8/14/19.
//  Copyright © 2019 Me_Myself_i. All rights reserved.
//

import Foundation

class BaseVM: NSObject {
    
    var dataModel: DataModel!
    
    init(_ chosenModel: DataModel) {
        super.init()
        self.dataModel = chosenModel
    }
    
    func goBack() {
        VCRouter.singletone.popBack()
    }
    
    func goto(_ vc: VCType, modelToPass: DataModel) {
        VCRouter.singletone.goto(vc, model: modelToPass)
    }
}
