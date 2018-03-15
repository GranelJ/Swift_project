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

extension Exercice {
    static func getAll() throws -> [Exercice] {
        let request : NSFetchRequest<Exercice> = Exercice.fetchRequest()
        do {
            let exerciceL = try ManageCoreData.context.fetch(request)
            return exerciceL
        } catch let error as NSError {
            throw error
        }
    }
    
    static func getAllOrdered() throws -> [Exercice] {
        let request : NSFetchRequest<Exercice> = Exercice.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "jour", ascending: true)]
        do {
            let exerciceL = try ManageCoreData.context.fetch(request)
            return exerciceL
        } catch let error as NSError {
            throw error
        }
    }
    
    
}
