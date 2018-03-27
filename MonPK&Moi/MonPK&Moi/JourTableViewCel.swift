//
//  File.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 27/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class JourTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heureLabel: UILabel!
    @IBOutlet weak var etatLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
