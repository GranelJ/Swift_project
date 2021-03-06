//
//  TraitementDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension TraitementDAO {
    
    static func save(){
        do{
            try ManageCoreData.context.save()
        }catch{
        }
    }
    
    static func createDAO() -> TraitementDAO{
        return TraitementDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forMomentPrise momentPrise: Date, forMedicament medicament: MedicamentDAO) -> TraitementDAO{
        let dao = self.createDAO()
        dao.moment_de_prise = momentPrise as NSDate
        dao.traitement_medicament = medicament
        
        self.save()
        
        return dao
    }
    
    static func searchDAO(forMomentPrise momentPrise: Date, forMedicament medicamentName: String) -> TraitementDAO?{
        let request : NSFetchRequest<TraitementDAO> = NSFetchRequest<TraitementDAO>(entityName: "TraitementDAO")
        request.predicate = NSPredicate(format: "moment_de_prise == %@ AND traitement_medicament.nom == %@", momentPrise as CVarArg, medicamentName)
        do{
            let result = try ManageCoreData.context.fetch(request) as [TraitementDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }
    
    static func deleteDAO(ForTraitement traitement: TraitementDAO){
        ManageCoreData.context.delete(traitement)
        self.save()
    }
    
    static func getAll() throws -> [Traitement]{
        var list: [Traitement] = []
        let request : NSFetchRequest<TraitementDAO> = NSFetchRequest<TraitementDAO>(entityName: "TraitementDAO")
        do{
            let result = try ManageCoreData.context.fetch(request) as [TraitementDAO]
            if (result.count>0) {
                for nb in 1...result.count{
                    let medicament = result[nb-1].traitement_medicament
                    let prise = Traitement(forMomentPrise: result[nb-1].moment_de_prise! as Date, forMedicament: medicament!)
                    list.append(prise)
                }
            }
        }
        catch{
            throw error
        }
        return list
    }
}
