//
//  Cell.swift
//  smrtBx
//
//  Created by Alexander Berezovsky on 8/14/19.
//  Copyright © 2019 Me_Myself_i. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var picImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descrLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.picImage.image = UIImage(named: "defaultPic")!
    }
}
