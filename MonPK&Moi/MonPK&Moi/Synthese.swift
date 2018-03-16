//
//  Synthese.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 16/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Synthese {
    
    private let dao : SyntheseDAO
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
    
    init(heure_debut: Int64, heure_fin: Int64, periodicite: Int64){
        guard let dao = SyntheseDAO.getNewSynthese() else{
            fatalError("impossible to get dao for synthese")
        }
        self.dao = dao
        self.dao.heure_debut = heure_debut
        self.dao.heure_fin = heure_fin
        self.dao.periodicite = periodicite
    }
    
}
