//
//  ExerciceModel.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension ExerciceDAO {
    
    static func createDAO() -> ExerciceDAO{
        return ExerciceDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forJour jour: Int64, forLibelle libelle: String) -> ExerciceDAO{
        let dao = self.createDAO()
        dao.jour=jour
        dao.libelle=libelle
        
        return dao
    }
    
    static func searchDAO(forJour jour: Int64, forLibelle libelle: String) -> ExerciceDAO?{
        let request : NSFetchRequest<ExerciceDAO> = NSFetchRequest<ExerciceDAO>()
        request.predicate = NSPredicate(format: "jour == %@ AND libelle == %@", jour, libelle)
        do{
            let result = try ManageCoreData.context.fetch(request) as [ExerciceDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }
    
    
}
