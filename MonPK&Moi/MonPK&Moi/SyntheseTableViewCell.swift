//
//  SyntheseTableViewCell.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 26/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class SyntheseTableViewCell: UITableViewCell {

    @IBOutlet weak var dateSynthese: UILabel!
    var date_rdv: Date!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
