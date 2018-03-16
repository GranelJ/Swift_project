//
//  Rdv.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 16/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Rdv {
    
    private let dao : RdvDAO
    var date_rdv : Date{
        get{
            return self.dao.date_rdv! as Date
        }
        set{
            self.dao.date_rdv = newValue as NSDate
        }
    }
    var libelle : String{
        get{
            return self.dao.libelle!
        }
        set{
            self.dao.libelle = newValue
        }
    }
    
    init(date_rdv: Date, libelle: String){
        guard let dao = RdvDAO.getNewRdv() else{
            fatalError("impossible to get dao for rdv")
        }
        self.dao = dao
        self.dao.date_rdv = date_rdv as NSDate
        self.dao.libelle = libelle
    }
    
}
