//
//  Patient.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Patient {
    
    private let dao : PatientDAO
    var date_naissance : Date{
        get{
            return self.dao.date_naissance! as Date
        }
        set{
            self.dao.date_naissance = newValue as NSDate
        }
    }
    var nom : String{
        get{
            return self.dao.nom!
        }
        set{
            self.dao.nom = newValue
        }
    }
    var prenom : String{
        get{
            return self.dao.prenom!
        }
        set{
            self.dao.prenom = newValue
        }
    }
    var temps_preparation: Int64{
        get{
            return self.dao.temps_preparation
        }
        set{
            self.dao.temps_preparation = newValue
        }
    }
    
    init(date_naissance: Date, nom: String, prenom: String, temps_preparation: Int64){
        guard let dao = PatientDAO.getNewPatient() else{
            fatalError("impossible to get dao for patient")
        }
        self.dao = dao
        self.dao.date_naissance = date_naissance as NSDate
        self.dao.nom = nom
        self.dao.prenom = prenom
        self.dao.temps_preparation = temps_preparation
    }
}
