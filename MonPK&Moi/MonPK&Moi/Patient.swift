//
//  Patient.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Patient {
    
    internal var dao : PatientDAO
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
    
    init(forDate date_naissance: Date,forNom nom: String,forPrenom prenom: String,forTempsPreparation temps_preparation: Int64){
        if let dao = PatientDAO.searchDAO(forBirthdate: date_naissance, forLastname: nom, forFirstname: prenom, forPrepareTime: temps_preparation){
            self.dao = dao
        }else{
            self.dao = PatientDAO.createDAO(forBirthdate: date_naissance, forLastname: nom, forFirstname: prenom, forPrepareTime: temps_preparation)
        }
    }
}
