//
//  RdvTableViewCell.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 20/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class RdvTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var medecinLabel: UILabel!
    @IBOutlet weak var libelleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
