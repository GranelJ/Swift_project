//
//  SyntheseDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension SyntheseDAO {
    
    static func createDAO() -> SyntheseDAO{
        return SyntheseDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forHeureDebut heure_debut: Int64,forHeureFin heure_fin: Int64,forPeriodicite periodicite: Int64) -> SyntheseDAO{
        let dao = self.createDAO()
        dao.heure_debut=heure_debut
        dao.heure_fin=heure_fin
        dao.periodicite=periodicite
        
        return dao
    }
    
    static func searchDAO(forHeureDebut heure_debut: Int64,forHeureFin heure_fin: Int64,forPeriodicite periodicite: Int64) -> SyntheseDAO?{
        let request : NSFetchRequest<SyntheseDAO> = NSFetchRequest<SyntheseDAO>()
        request.predicate = NSPredicate(format: "heure_debut == %@ AND heure_fin == %@ AND periodicite == %@", heure_debut, heure_fin, periodicite)
        do{
            let result = try ManageCoreData.context.fetch(request) as [SyntheseDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }
}
