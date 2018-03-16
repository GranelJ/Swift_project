//
//  File.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 16/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation


class Prise_medicament {
    
    private let dao : Prise_medicamentDAO
    var date : Date{
        get{
            return self.dao.date! as Date
        }
        set{
            self.dao.date = newValue as NSDate
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
    
    init(date: Date, libelle: String){
        guard let dao = Prise_medicamentDAO.getNewPrise_medicament() else{
            fatalError("impossible to get dao for prise_medicament")
        }
        self.dao = dao
        self.dao.date = date as NSDate
        self.dao.libelle = libelle
    }
    
}
