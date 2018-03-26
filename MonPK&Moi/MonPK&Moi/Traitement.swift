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
    
    var moment_de_prise: Date{
        get{
            return self.dao.moment_de_prise as! Date
        }
        set{
            self.dao.moment_de_prise = newValue as NSDate
        }
    }
    
    init(forMomentPrise momentPrise: Date, forMedicament newMedicament: MedicamentDAO){
        if let ndao = TraitementDAO.searchDAO(forMomentPrise: momentPrise, forMedicament: newMedicament.nom!){
            self.dao = ndao
        }else{
            self.dao = TraitementDAO.createDAO(forMomentPrise: momentPrise, forMedicament: newMedicament)
        }
        //self.dao.traitement_medicament=newMedicament
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
