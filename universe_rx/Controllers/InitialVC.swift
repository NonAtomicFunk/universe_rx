//
//  InitialVC.swift
//  smrtBx
//
//  Created by Alexander Berezovsky on 8/14/19.
//  Copyright © 2019 Me_Myself_i. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources
import AlamofireImage

class InitialVC: UIViewController {

    var viewModel: InitialVM!
    
    @IBOutlet weak var segmentControll: UISegmentedControl!
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        self.viewModel.getAll()
        self.uiSetup()
        self.bindAll()
    }
    
    func initialSetup() {
        self.viewModel = InitialVM()
    }
    
    func uiSetup() {
        
        self.segmentControll.tintColor = Constants().reddishOrange
        self.segmentControll.setTitle("Events", forSegmentAt: 0)
        self.segmentControll.setTitle("Shops", forSegmentAt: 1)
        
        self.table.register(UINib(nibName: "Cell",
                                  bundle: nil),
                                  forCellReuseIdentifier: "Cell")
        self.table.estimatedRowHeight = 58
        self.navigationItem.title = "World Dev Event"
    }
    
    func bindAll() {

        self.segmentControll.rx.selectedSegmentIndex.subscribe { [weak self] indexChosen in
            
            switch indexChosen.element {
            case 0:
                self!.viewModel.sortBy(.events)
            case 1 :
                self!.viewModel.sortBy(.shops)
            default:
                self!.viewModel.sortBy(.events)
            }
        }.disposed(by: self.viewModel.bag)
        
        self.viewModel.dataModel.asObservable()
            .bind(to: self.table.rx.items(cellIdentifier: "Cell", cellType: Cell.self)) { row, model, cell in
                
                cell.accessoryType = .disclosureIndicator
                
                cell.descrLbl.text = model.shortDescription
                cell.titleLbl.text = model.title
                
                let url = URL(string: model.smallImage)!
                cell.picImage.af_setImage(withURL: url)
            }.disposed(by: self.viewModel.bag)

        self.table.rx.itemSelected.subscribe { [weak self] tapAtIndex in

            let index = tapAtIndex.element!.row
            print("TAP: ", index)
            self!.viewModel.goToDetils(index)
        }.disposed(by: self.viewModel.bag)
    }
}
