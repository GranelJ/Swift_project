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
    
    static func save(){
        do{
            try ManageCoreData.context.save()
        }catch{
        }
    }
    
    static func createDAO() -> ExerciceDAO{
        return ExerciceDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forJour jour: Int64, forLibelle libelle: String) -> ExerciceDAO{
        let dao = self.createDAO()
        dao.jour=jour
        dao.libelle=libelle
        
        self.save()
        
        return dao
    }
    
    static func searchDAO(forJour jour: Int64, forLibelle libelle: String) -> ExerciceDAO?{
        let request : NSFetchRequest<ExerciceDAO> = NSFetchRequest<ExerciceDAO>(entityName: "ExerciceDAO")
        request.predicate = NSPredicate(format: "jour == %d AND libelle == %@", jour, libelle)
        do{
            let result = try ManageCoreData.context.fetch(request) as [ExerciceDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }
    
    static func deleteDAO(ForExercice exercice: ExerciceDAO){
        ManageCoreData.context.delete(exercice)
        self.save()
    }
    
    static func getAll() throws -> [Exercice]{
        var list: [Exercice] = []
        let request : NSFetchRequest<ExerciceDAO> = NSFetchRequest<ExerciceDAO>(entityName: "ExerciceDAO")
        do{
            let result = try ManageCoreData.context.fetch(request) as [ExerciceDAO]
            for nb in 1...result.count{
                let ex = Exercice(forJour: result[nb].jour,forLibelle: result[nb].libelle!)
                list.append(ex)
            }
        }
        catch{
            throw error
        }
        return list
    }
    
    static func getAllOrdered() throws -> [Exercice]{
        var list: [Exercice] = []
        let request : NSFetchRequest<ExerciceDAO> = NSFetchRequest<ExerciceDAO>(entityName: "ExerciceDAO")
        request.sortDescriptors = [NSSortDescriptor(key:"jour", ascending: true)]
        do{
            let result = try ManageCoreData.context.fetch(request)
            if (result.count>0){
                for nb in 1...result.count{
                    let ex = Exercice(forJour: result[nb-1].jour,forLibelle: result[nb-1].libelle!)
                    list.append(ex)
                }
            }
        }
        catch{
            throw error
        }
        return list
    }
}
