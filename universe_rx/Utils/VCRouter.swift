//
//  VCRouter.swift
//  universe_rx
//
//  Created by Alexander Berezovsky on 8/14/19.
//  Copyright © 2019 Me_Myself_i. All rights reserved.
//

import UIKit

final class VCRouter: NSObject {
    
    static let singletone = VCRouter()
    
    var storyBoard: UIStoryboard!
    var navigationSontroller: UINavigationController!
    var window: UIWindow!
    
    override init() {
        super.init()
        
        let uiWindow: UIWindow = SceneDelegate().window ?? UIWindow()
        self.window = uiWindow
        
        self.storyBoard = UIStoryboard(name: "Main", bundle: nil)
        self.navigationSontroller = storyBoard.instantiateInitialViewController() as? UINavigationController
        self.navigationSontroller.navigationBar.tintColor = .black
        
        uiWindow.rootViewController = navigationSontroller
    }
    
    func popBack() {
        self.navigationSontroller.popViewController(animated: true)
    }
    
    func goto(_ vc: VCType, model: DataModel) {
        
        let tempModel = model
        
        var vcToGo: BaseVC!
        var vm: BaseVM!
        
        switch vc {
        case .details:
            vcToGo = storyBoard.instantiateViewController(withIdentifier: vc.rawValue) as! DetailsVC
            print("VC: ", vcToGo!, "model: " ,tempModel.id)
            vm = DetailsVM(tempModel)
        case .map:
            vcToGo = storyBoard.instantiateViewController(withIdentifier: vc.rawValue) as! MapVC
            print("VC: ", vcToGo!, "model: " ,tempModel.id)
            vm = MapVM(tempModel)
        }
        
        vcToGo.viewModel = vm
        vcToGo.navigationItem.hidesBackButton = true
        print("Any nav luck???", self.navigationSontroller)
        self.navigationSontroller!.pushViewController(vcToGo!, animated: true)
//        self.window.rootViewController = vcToGo
    }
}
