//
//  MedicamentTableViewCell.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 28/02/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class MedicamentTableViewCell: UITableViewCell {
    @IBOutlet weak var period: UILabel! // labels in the cell
    @IBOutlet weak var drug: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
