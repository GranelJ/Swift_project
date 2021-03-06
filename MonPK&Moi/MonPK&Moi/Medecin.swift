//
//  Medecin.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 16/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Medecin {
    
    internal var dao : MedecinDAO
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
    
    init(forEmail email: String,forLieu lieu_travail: String,forNom nom: String,forPrenom prenom: String,forProfession profession: String,forTelephone telephone: String){
        if let dao = MedecinDAO.searchDAO(forEmail: email,forLieu: lieu_travail,forNom: nom,forPrenom: prenom,forProfession: profession,forTelephone: telephone){
            self.dao = dao
        }else{
            self.dao = MedecinDAO.createDAO(forEmail: email,forLieu: lieu_travail,forNom: nom,forPrenom: prenom,forProfession: profession,forTelephone: telephone)
        }
    }
    
    /// Function to delete a medecin
    func delete(){
        MedecinDAO.deleteDAO(ForMedecin: self.dao)
    }
    
    /// Function to get all the medecin form the DB
    ///
    /// - Returns: a list of medecin
    /// - Throws: throw error
    static func getAll() throws -> [Medecin]{
        do{
            return try MedecinDAO.getAll()
        }catch{
            throw error
        }
        
    }
    
}
