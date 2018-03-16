//
//  Medecin.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 16/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Medecin {
    
    private let dao : MedecinDAO
    var email : String{
        get{
            return self.dao.email!
        }
        set{
            self.dao.email = newValue
        }
    }
    var lieu_travail : String{
        get{
            return self.dao.lieu_travail!
        }
        set{
            self.dao.lieu_travail = newValue
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
    var profession : String{
        get{
            return self.dao.profession!
        }
        set{
            self.dao.profession = newValue
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
    
    init(email: String, lieu_travail: String, nom: String, prenom: String, profession: String, telephone: String){
        guard let dao = MedecinDAO.getNewMedecin() else{
            fatalError("impossible to get dao for medecin")
        }
        self.dao = dao
        self.dao.email = email
        self.dao.lieu_travail = lieu_travail
        self.dao.nom = nom
        self.dao.prenom = prenom
        self.dao.profession = profession
        self.dao.telephone = telephone
    }
    
}
