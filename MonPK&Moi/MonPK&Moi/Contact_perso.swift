//
//  Contact_perso.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Contact_perso {
    
    internal var dao : Contact_persoDAO
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
    
    init(forEmail email: String, forNom nom: String, forPrenom prenom: String, forTelephone telephone: String){
        if let dao = Contact_persoDAO.searchDAO(forEmail: email, forNom: nom, forPrenom: prenom, forTelephone: telephone){
            self.dao = dao
        }else{
            self.dao = Contact_persoDAO.createDAO(forEmail: email, forNom: nom, forPrenom: prenom, forTelephone: telephone)
        }
    }
    
    /// Function to delete a personnal contact
    func delete(){
        Contact_persoDAO.deleteDAO(ForContact: self.dao)
    }
    
    /// Function to get all the pesonnal contact from the DB
    ///
    /// - Returns: a list of personnal contact
    /// - Throws: throw error
    static func getAll() throws -> [Contact_perso]{
        do{
            return try Contact_persoDAO.getAll()
        }catch{
            throw error
        }
    }

}
