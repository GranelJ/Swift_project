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
    
    static func save(){
        do{
            try ManageCoreData.context.save()
        }catch{
        }
    }
    
    static func createDAO() -> Prise_medicamentDAO{
        return Prise_medicamentDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forDate date: Date,forLibelle libelle: String) -> Prise_medicamentDAO{
        let dao = self.createDAO()
        dao.date=date as NSDate
        dao.libelle=libelle
        
        self.save()
        
        return dao
    }
    
    static func searchDAO(forDate date: Date,forLibelle libelle: String) -> Prise_medicamentDAO?{
        let request : NSFetchRequest<Prise_medicamentDAO> = NSFetchRequest<Prise_medicamentDAO>(entityName: "Prise_medicamentDAO")
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
    
    static func deleteDAO(ForPrise prise: Prise_medicamentDAO){
        ManageCoreData.context.delete(prise)
        self.save()
    }
    
    static func getAll() throws -> [Prise_medicament]{
        var list: [Prise_medicament] = []
        let request : NSFetchRequest<Prise_medicamentDAO> = NSFetchRequest<Prise_medicamentDAO>(entityName: "Prise_medicamentDAO")
        do{
            let result = try ManageCoreData.context.fetch(request) as [Prise_medicamentDAO]
            if (result.count>0) {
                for nb in 1...result.count{
                    let synthese = Synthese(forHeureDebut: (result[nb-1].prise_medicament_synthese?.heure_debut)!, forHeureFin: (result[nb-1].prise_medicament_synthese?.heure_fin)!, forPeriodicite: (result[nb-1].prise_medicament_synthese?.periodicite)!)
                    let prise = Prise_medicament(forDate: (result[nb-1].date!) as Date,forLibelle: result[nb-1].libelle!,forSynthese: synthese)
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
