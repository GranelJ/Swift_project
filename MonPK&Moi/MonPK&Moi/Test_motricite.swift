//
//  Test_motricite.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 16/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation

class Test_motricite {
    
    private let dao : Test_motriciteDAO
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
    
    init(date_test: Date, reponse: String){
        guard let dao = Test_motriciteDAO.getNewTest_motricite() else{
            fatalError("impossible to get dao for test_motricite")
        }
        self.dao = dao
        self.dao.date_test = date_test as NSDate
        self.dao.reponse = reponse
    }
    
}
