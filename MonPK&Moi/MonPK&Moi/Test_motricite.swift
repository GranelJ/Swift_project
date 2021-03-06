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
    var synthese : Synthese?{
        get{
            return self.synthese
        }
        set{
            self.synthese = newValue
            self.dao.motricite_synthese = newValue?.dao
        }
    }
    
    init(forDate date: Date,forReponse reponse: String, forSynthese newSynthese: Synthese?){
        if let dao = Test_motriciteDAO.searchDAO(forDate: date,forReponse: reponse){
            self.dao = dao
        }else{
            self.dao = Test_motriciteDAO.createDAO(forDate: date,forReponse: reponse)
        }
        if let synth = newSynthese{
            self.synthese = synth
            self.dao.motricite_synthese = synth.dao
        }
    }
    
    /// Function to delete a test
    func delete(){
        Test_motriciteDAO.deleteDAO(ForTest: self.dao)
    }
    
    /// Function to get all the test from the DB
    ///
    /// - Returns: a list of test
    /// - Throws: throw error
    static func getAll() throws -> [Test_motricite]{
        do{
            return try Test_motriciteDAO.getAll()
        }catch{
            throw error
        }
    }
    
    static func getAllDiffDay(diff: Int, date: Date) throws -> [Test_motricite]{
        do{
            return try Test_motriciteDAO.getAllDiffDay(diff: diff,date: date)
        }catch{
            throw error
        }
    }
    
}
