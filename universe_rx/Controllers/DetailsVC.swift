//
//  DetailsVC.swift
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

class DetailsVC: BaseVC {
    
    @IBOutlet weak var maineImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var mainDescrLbl: UILabel!
    @IBOutlet weak var showOnMapBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiSetup()
    }
    
    func uiSetup() {
        let urlStr = self.viewModel.dataModel.bigImage
        let url = URL(string: urlStr)!
        self.maineImg.af_setImage(withURL: url)
        
        self.titleLbl.text = self.viewModel.dataModel.title
        self.dateLbl.text = self.viewModel.dataModel.shortDescription
        self.mainDescrLbl.text = self.viewModel.dataModel.description
        
        self.showOnMapBtn.backgroundColor = Constants().green
    }
    
    @IBAction func showOnMapBtnTapped(_ sender: Any) {
        (self.viewModel as! DetailsVM).gotoMap()
    }
}
