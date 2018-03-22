//
//  Test_motricite.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 16/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Test_motricite {
    
    internal var dao : Test_motriciteDAO
    var date_test : Date{
        get{
            return self.dao.date_test! as Date
        }
        set{
            self.dao.date_test = newValue as NSDate
        }
    }
    var reponse : String{
        get{
            return self.dao.reponse!
        }
        set{
            self.dao.reponse = newValue
        }
    }
    
    init(forDate date: Date,forReponse reponse: String){
        if let dao = Test_motriciteDAO.searchDAO(forDate: date,forReponse: reponse){
            self.dao = dao
        }else{
            self.dao = Test_motriciteDAO.createDAO(forDate: date,forReponse: reponse)
        }
    }
    
}
