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
    
    var moment_de_prise: String{
        get{
            return self.dao.moment_de_prise!
        }
        set{
            self.dao.moment_de_prise = newValue
        }
    }
    
    init(forMomentPrise momentPrise: String, forMedicament newMedicament: Medicament){
        if let dao = TraitementDAO.searchDAO(forMomentPrise: momentPrise){
            self.dao = dao
        }else{
            self.dao = TraitementDAO.createDAO(forMomentPrise: momentPrise)
        }
        //self.medicament = newMedicament
        self.dao.traitement_medicament=newMedicament.dao
    }
    
    func delete(){
        TraitementDAO.deleteDAO(ForTraitement: self.dao)
    }
    
    static func getAll() throws -> [Traitement]{
        do{
            return try TraitementDAO.getAll()
        }catch{
            throw error
        }
        
    }
    
}
