//
//  InitialVM.swift
//  universe_rx
//
//  Created by Alexander Berezovsky on 8/14/19.
//  Copyright © 2019 Me_Myself_i. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class InitialVM {
    
    let bag = DisposeBag()
    
    let allData = BehaviorRelay<[DataModel]>(value: [])
    let dataModel = BehaviorRelay<[DataModel]>(value: [])
    
    func getAll() {
        Rest.singleTon.getAll { [weak self] (array) in
            let storableArray = array
            self!.allData.accept(storableArray)
            self!.sortBy(.events)
        }
    }
    
    func sortBy(_ typeChosen: SmrtBxTypes) {
        
        self.dataModel.accept(self.allData.value.filter({ [weak self] item -> Bool in
            return item.type == typeChosen.rawValue
        }))
    }
    
    func goToDetils(_ modelAtIndx: Int) {
        print("!!!!!", self.dataModel)
        let modelToPass = self.dataModel.value[modelAtIndx]
        
        VCRouter.singletone.goto(.details, model: modelToPass)
    }
}
