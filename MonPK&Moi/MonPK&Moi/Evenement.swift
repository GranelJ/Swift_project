//
//  Evenement.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Evenement {
    
    internal var dao : EvenementDAO
    var date_evt : Date{
        get{
            return self.dao.date_evt! as Date
        }
        set{
            self.dao.date_evt = newValue as NSDate
        }
    }
    var desc_evt : String{
        get{
            return self.dao.desc_evt!
        }
        set{
            self.dao.desc_evt = newValue
        }
    }
    var type : String{
        get{
            return self.dao.type!
        }
        set{
            self.dao.type = newValue
        }
    }
    
    init(forDate date_evt: Date,forDesc desc_evt: String,forType type: String){
        if let dao = EvenementDAO.searchDAO(forDate: date_evt,forDesc: desc_evt,forType: type){
            self.dao = dao
        }else{
            self.dao = EvenementDAO.createDAO(forDate: date_evt,forDesc: desc_evt,forType: type)
        }
    }
    
    func delete(){
        EvenementDAO.deleteDAO(ForEvenement: self.dao)
    }
    
    static func getAll() throws -> [Evenement]{
        do{
            return try EvenementDAO.getAll()
        }catch{
            throw error
        }
    }
}
