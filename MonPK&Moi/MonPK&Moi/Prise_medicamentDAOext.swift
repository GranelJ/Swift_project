//
//  Prise_medicamentDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Prise_medicamentDAO {
    
    static func createDAO() -> Prise_medicamentDAO{
        return Prise_medicamentDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forDate date: Date,forLibelle libelle: String) -> Prise_medicamentDAO{
        let dao = self.createDAO()
        dao.date=date as NSDate
        dao.libelle=libelle
        
        return dao
    }
    
    static func searchDAO(forDate date: Date,forLibelle libelle: String) -> Prise_medicamentDAO?{
        let request : NSFetchRequest<Prise_medicamentDAO> = NSFetchRequest<Prise_medicamentDAO>()
        request.predicate = NSPredicate(format: "date == %@ AND libelle == %@", date as CVarArg, libelle)
        do{
            let result = try ManageCoreData.context.fetch(request) as [Prise_medicamentDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }
}
