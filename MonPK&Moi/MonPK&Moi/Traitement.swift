//
//  Traitement.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 16/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Traitement {
    
    private let dao : TraitementDAO
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
    
    init(date_debut: Date, date_fin: Date, frequence: Int64, moment_de_prise: String){
        guard let dao = TraitementDAO.getNewTraitement() else{
            fatalError("impossible to get dao for traitement")
        }
        self.dao = dao
        self.dao.date_debut = date_debut as NSDate
        self.dao.date_fin = date_fin as NSDate
        self.dao.frequence = frequence
        self.dao.moment_de_prise = moment_de_prise
    }
    
    func getAll() throws -> [TraitementDAO]{
        do{
            let traitementL = try TraitementDAO.getAll()
            return traitementL
        }
        catch let error as NSError{
            throw error
        }
        
    }
    
}
