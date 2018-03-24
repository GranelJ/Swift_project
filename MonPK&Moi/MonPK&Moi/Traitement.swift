//
//  Traitement.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 16/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Traitement {
    
    internal var dao : TraitementDAO
    var date_debut: Date{
        get{
            return self.dao.date_debut! as Date
        }
        set{
            self.dao.date_debut = newValue as NSDate
        }
    }
    var date_fin: Date{
        get{
            return self.dao.date_fin! as Date
        }
        set{
            self.dao.date_fin = newValue as NSDate
        }
    }
    var frequence: Int64{
        get{
            return self.dao.frequence
        }
        set{
            self.dao.frequence = newValue
        }
    }
    var moment_de_prise: String{
        get{
            return self.dao.moment_de_prise!
        }
        set{
            self.dao.moment_de_prise = newValue
        }
    }
    var medicament: Medicament{
        get{
            return self.medicament
        }
        set{
            self.medicament = newValue
            self.dao.traitement_medicament=newValue.dao
        }
    }
    
    init(forDateDebut dateDebut: Date,forDateFin dateFin: Date,forFrequence frequence: Int64, forMomentPrise momentPrise: String, forMedicament newMedicament: Medicament){
        if let dao = TraitementDAO.searchDAO(forDateDebut: dateDebut,forDateFin: dateFin,forFrequence: frequence, forMomentPrise: momentPrise){
            self.dao = dao
        }else{
            self.dao = TraitementDAO.createDAO(forDateDebut: dateDebut,forDateFin: dateFin,forFrequence: frequence, forMomentPrise: momentPrise)
        }
        self.medicament = newMedicament
        self.dao.traitement_medicament=newMedicament.dao
    }
    
    func delete(){
        TraitementDAO.deleteDAO(ForTraitement: self.dao)
    }
    
    func getAll() throws -> [Traitement]{
        do{
            return try TraitementDAO.getAll()
        }catch{
            throw error
        }
        
    }
    
}
