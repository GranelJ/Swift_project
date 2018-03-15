//
//  Evenement.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Evenement {
    
    private let dao : EvenementDAO
    var date_evt : Date{
        get{
            return self.dao.date_evt! as Date
        }
        set{
            self.dao.date_evt = newValue as NSDate
        }
    }
    var desc_evt : String{
        get{
            return self.dao.desc_evt!
        }
        set{
            self.dao.desc_evt = newValue
        }
    }
    var type : String{
        get{
            return self.dao.type!
        }
        set{
            self.dao.type = newValue
        }
    }
    
    init(date_evt: Date, desc_evt: String, type: String){
        guard let dao = EvenementDAO.getNewEvenement() else{
            fatalError("impossible to get dao for patient")
        }
        self.dao = dao
        self.dao.date_evt = date_evt as NSDate
        self.dao.desc_evt = desc_evt
        self.dao.type = type
    }
    
}
