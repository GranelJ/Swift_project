//
//  Test_motriciteDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Test_motriciteDAO {
    
    static func save(){
        do{
            try ManageCoreData.context.save()
        }catch{
        }
    }
    
    static func createDAO() -> Test_motriciteDAO{
        return Test_motriciteDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forDate date: Date,forReponse reponse: String) -> Test_motriciteDAO{
        let dao = self.createDAO()
        dao.date_test=date as NSDate
        dao.reponse=reponse
        
        self.save()
        
        return dao
    }
    
    static func searchDAO(forDate date: Date,forReponse reponse: String) -> Test_motriciteDAO?{
        let request : NSFetchRequest<Test_motriciteDAO> = NSFetchRequest<Test_motriciteDAO>()
        request.predicate = NSPredicate(format: "date_test == %@ AND reponse == %@", date as CVarArg, reponse)
        do{
            let result = try ManageCoreData.context.fetch(request) as [Test_motriciteDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }
}
