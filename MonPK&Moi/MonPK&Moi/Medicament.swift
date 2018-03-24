//
//  Medicament.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 16/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Medicament {
    
    internal var dao : MedicamentDAO
    var desc_med : String{
        get{
            return self.dao.desc_med!
        }
        set{
            self.dao.desc_med = newValue
        }
    }
    var dosage : String{
        get{
            return self.dao.dosage!
        }
        set{
            self.dao.dosage = newValue
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
    
    init(forDesc desc_med: String,forDosage dosage: String,forNom nom: String){
        if let dao = MedicamentDAO.searchDAO(forDesc: desc_med,forDosage: dosage,forNom: nom){
            self.dao = dao
        }else{
            self.dao = MedicamentDAO.createDAO(forDesc: desc_med,forDosage: dosage,forNom: nom)
        }
    }
    
    func delete(){
        MedicamentDAO.deleteDAO(ForMedicament: self.dao)
    }
    
    func getAll() throws -> [Medicament]{
        do{
            return try Medicament.getAll()
        }catch{
            throw error
        }
    }
    
}
