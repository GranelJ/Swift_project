//
//  Exercice.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Exercice {
    
    internal var dao : ExerciceDAO
    var jour : Int64{
        get{
            return self.dao.jour
        }
        set{
            self.dao.jour = newValue
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
    
    init(forJour jour: Int64,forLibelle libelle: String){
        if let dao = ExerciceDAO.searchDAO(forJour: jour, forLibelle: libelle){
            self.dao = dao
        }else{
            self.dao = ExerciceDAO.createDAO(forJour: jour, forLibelle: libelle)
        }
    }
    
    /// Function to delete an exercice
    func delete(){
        ExerciceDAO.deleteDAO(ForExercice: self.dao)
    }
    
    /// Function to get all the exercice from the DB
    ///
    /// - Returns: a list of Exercice
    /// - Throws: throw error
    static func getAll() throws -> [Exercice]{
        do{
            return try ExerciceDAO.getAll()
        }catch{
            throw error
        }
    }
    
    /// Function to get all the exercice ordered by day from the DB
    ///
    /// - Returns: a list of exercice
    /// - Throws: throw error
    static func getAllOrdered() throws -> [Exercice]{
        do{
            return try ExerciceDAO.getAllOrdered()
        }catch{
            throw error
        }
    }

}
