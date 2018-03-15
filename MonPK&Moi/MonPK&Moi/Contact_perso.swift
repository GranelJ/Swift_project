//
//  Contact_perso.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Contact_perso {
    
    private let dao : Contact_persoDAO
    var email : String{
        get{
            return self.dao.email!
        }
        set{
            self.dao.email = newValue
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
    var telephone : String{
        get{
            return self.dao.telephone!
        }
        set{
            self.dao.telephone = newValue
        }
    }
    
    init(email: String, nom: String, prenom: String, telephone: String){
        guard let dao = Contact_persoDAO.getNewContact_perso() else{
            fatalError("impossible to get dao for patient")
        }
        self.dao = dao
        self.dao.email = email
        self.dao.nom = nom
        self.dao.prenom = prenom
        self.dao.telephone = telephone
    }
    
}
