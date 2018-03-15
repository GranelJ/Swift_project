//
//  Exercice.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Exercice {
    
    private let dao : ExerciceDAO
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
    
    init(jour: Int64, libelle: String){
        guard let dao = ExerciceDAO.getNewExercice() else{
            fatalError("impossible to get dao for patient")
        }
        self.dao = dao
        self.dao.jour = jour
        self.dao.libelle = libelle
    }

}
