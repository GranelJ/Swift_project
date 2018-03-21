//
//  EvenementDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension EvenementDAO {
    
    static func createDAO() -> EvenementDAO{
        return EvenementDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forDate date_evt: Date,forDesc desc_evt: String,forType type: String) -> EvenementDAO{
        let dao = self.createDAO()
        dao.date_evt=date_evt as NSDate
        dao.desc_evt=desc_evt
        dao.type=type
        
        return dao
    }
    
    static func searchDAO(forDate date_evt: Date,forDesc desc_evt: String,forType type: String) -> EvenementDAO?{
        let request : NSFetchRequest<EvenementDAO> = NSFetchRequest<EvenementDAO>()
        request.predicate = NSPredicate(format: "date_evt == %@ AND desc_evt == %@ AND type == %@", date_evt as CVarArg, desc_evt, type)
        do{
            let result = try ManageCoreData.context.fetch(request) as [EvenementDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }
}
