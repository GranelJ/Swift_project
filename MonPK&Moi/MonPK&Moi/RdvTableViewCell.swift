//
//  RdvTableViewCell.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 21/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class RdvTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var libelleLabel: UILabel!
    @IBOutlet weak var medecinLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
