//
//  Medicament.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 16/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Medicament {
    
    private let dao : MedicamentDAO
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
    
    init(desc_med: String, dosage: String, nom: String){
        guard let dao = MedicamentDAO.getNewMedicament() else{
            fatalError("impossible to get dao for medicament")
        }
        self.dao = dao
        self.dao.desc_med = desc_med
        self.dao.dosage = dosage
        self.dao.nom = nom
    }
    
}
