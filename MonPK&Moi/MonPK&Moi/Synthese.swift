//
//  Synthese.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 16/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Synthese {
    
    internal var dao : SyntheseDAO
    var heure_debut : Int64{
        get{
            return self.dao.heure_debut
        }
        set{
            self.dao.heure_debut = newValue
        }
    }
    var heure_fin : Int64{
        get{
            return self.dao.heure_fin
        }
        set{
            self.dao.heure_fin = newValue
        }
    }
    var periodicite : Int64{
        get{
            return self.dao.periodicite
        }
        set{
            self.dao.periodicite = newValue
        }
    }
    
    init(forHeureDebut heure_debut: Int64,forHeureFin heure_fin: Int64,forPeriodicite periodicite: Int64, forRdv rdv: RdvDAO){
        if let dao = SyntheseDAO.searchDAO(forHeureDebut: heure_debut,forHeureFin: heure_fin,forPeriodicite: periodicite, forRdv: rdv){
            self.dao = dao
        }else{
            self.dao = SyntheseDAO.createDAO(forHeureDebut: heure_debut,forHeureFin: heure_fin,forPeriodicite: periodicite, forRdv: rdv)
        }
    }
    
    /// Function to delete a synthese
    func delete(){
        SyntheseDAO.deleteDAO(ForSynthese: self.dao)
    }
    
    /// Function to get all the synthese
    ///
    /// - Returns: a list a synthese
    /// - Throws: throw error
    static func getAll() throws -> [Synthese]{
        do{
            return try SyntheseDAO.getAll()
        }catch{
            throw error
        }
    }
}
