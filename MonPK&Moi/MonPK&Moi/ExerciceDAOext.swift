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
    
    static func getNewExercice() -> ExerciceDAO?{
        guard let entity = NSEntityDescription.entity(forEntityName: "ExerciceDAO", in: ManageCoreData.context) else{
            return nil
        }
        let exercice = ExerciceDAO(entity: entity, insertInto: ManageCoreData.context)
        return exercice
    }
    
    static func getAll() throws -> [ExerciceDAO] {
        let request : NSFetchRequest<ExerciceDAO> = ExerciceDAO.fetchRequest()
        do {
            let exerciceL = try ManageCoreData.context.fetch(request)
            return exerciceL
        } catch let error as NSError {
            throw error
        }
    }
    
    static func getAllOrdered() throws -> [ExerciceDAO] {
        let request : NSFetchRequest<ExerciceDAO> = ExerciceDAO.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "jour", ascending: true)]
        do {
            let exerciceL = try ManageCoreData.context.fetch(request)
            return exerciceL
        } catch let error as NSError {
            throw error
        }
    }
    
    
}
