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
    var synthese : Synthese?{
        get{
            return self.synthese
        }
        set{
            self.synthese = newValue
            self.dao.prise_medicament_synthese = newValue?.dao
        }
    }
    
    init(forDate date: Date,forLibelle libelle: String, forSynthese newSynthese: Synthese?){
        if let dao = Prise_medicamentDAO.searchDAO(forDate: date,forLibelle: libelle){
            self.dao = dao
        }else{
            self.dao = Prise_medicamentDAO.createDAO(forDate: date,forLibelle: libelle)
        }
        if let synth = newSynthese{
            self.synthese = synth
            self.dao.prise_medicament_synthese = synth.dao
        }
    }
    
    /// Function to delete a Prise_medicament
    func delete(){
        Prise_medicamentDAO.deleteDAO(ForPrise: self.dao)
    }
    
    /// Function to get all the Prise_medicament from the DB
    ///
    /// - Returns: a list of Prise_medicament
    /// - Throws: throw error
    static func getAll() throws -> [Prise_medicament]{
        do{
            return try Prise_medicamentDAO.getAll()
        }catch{
            throw error
        }
    }
    
}
