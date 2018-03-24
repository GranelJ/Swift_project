//
//  Rdv.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 16/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Rdv {
    
    internal var dao : RdvDAO
    var date_rdv : Date{
        get{
            return self.dao.date_rdv! as Date
        }
        set{
            self.dao.date_rdv = newValue as NSDate
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
    var medecin : Medecin{
        get{
            return self.medecin
        }
        set{
            self.medecin = newValue
            self.dao.rdv_medecin = newValue.dao
        }
    }
    var synthese : Synthese?{
        get{
            return self.synthese
        }
        set{
            self.synthese = newValue
            self.dao.rdv_synthese = newValue?.dao
        }
    }
    
    init(forDate date: Date,forLibelle libelle: String, forMedecin newMedecin: Medecin, forSynthese newSynthese: Synthese?){
        if let dao = RdvDAO.searchDAO(forDate: date,forLibelle: libelle){
            self.dao = dao
        }else{
            self.dao = RdvDAO.createDAO(forDate: date,forLibelle: libelle)
        }
        self.medecin = newMedecin
        self.dao.rdv_medecin=newMedecin.dao
        
        if let synth = newSynthese{
            self.synthese = synth
            self.dao.rdv_synthese = synth.dao
        }
    }
    
    func delete(){
        RdvDAO.deleteDAO(ForRdv: self.dao)
    }
    
    static func getAll() throws -> [Rdv]{
        do{
            return try RdvDAO.getAll()
        }catch{
            throw error
        }
    }
    
}
