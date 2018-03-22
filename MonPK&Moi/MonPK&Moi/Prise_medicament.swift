//
//  File.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 16/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation


class Prise_medicament {
    
    internal var dao : Prise_medicamentDAO
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
    
    init(forDate date: Date,forLibelle libelle: String){
        if let dao = Prise_medicamentDAO.searchDAO(forDate: date,forLibelle: libelle){
            self.dao = dao
        }else{
            self.dao = Prise_medicamentDAO.createDAO(forDate: date,forLibelle: libelle)
        }
    }
    
}
