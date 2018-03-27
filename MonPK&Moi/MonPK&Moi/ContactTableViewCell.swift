//
//  ContactTableViewCell.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 14/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var contactLastName: UILabel!
    @IBOutlet weak var contactFirstName: UILabel!
    @IBOutlet weak var contactNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
