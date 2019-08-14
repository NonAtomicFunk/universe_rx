//
//  DetailsVM.swift
//  universe_rx
//
//  Created by Alexander Berezovsky on 8/14/19.
//  Copyright © 2019 Me_Myself_i. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class DetailsVM: BaseVM {
    
    let bag = DisposeBag()
    
    func gotoMap() {
        VCRouter.singletone.goto(.map, model: self.dataModel)
    }
}
