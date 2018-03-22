//
//  RdvDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension RdvDAO {
    
    static func createDAO() -> RdvDAO{
        return RdvDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forDate date: Date,forLibelle libelle: String) -> RdvDAO{
        let dao = self.createDAO()
        dao.date_rdv=date as NSDate
        dao.libelle=libelle
        
        return dao
    }
    
    static func searchDAO(forDate date: Date,forLibelle libelle: String) -> RdvDAO?{
        let request : NSFetchRequest<RdvDAO> = NSFetchRequest<RdvDAO>()
        request.predicate = NSPredicate(format: "date_rdv == %@ AND libelle == %@", date as CVarArg, libelle)
        do{
            let result = try ManageCoreData.context.fetch(request) as [RdvDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }
}
