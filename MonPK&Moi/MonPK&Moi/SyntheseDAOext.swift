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
    
    static func getNewSynthese() -> SyntheseDAO?{
        guard let entity = NSEntityDescription.entity(forEntityName: "SyntheseDAO", in: ManageCoreData.context) else{
            return nil
        }
        let synthese = SyntheseDAO(entity: entity, insertInto: ManageCoreData.context)
        return synthese
    }
    
    static func getAll() throws -> [SyntheseDAO] {
        let request : NSFetchRequest<SyntheseDAO> = SyntheseDAO.fetchRequest()
        do {
            let syntheseL = try ManageCoreData.context.fetch(request)
            return syntheseL
        } catch let error as NSError {
            throw error
        }
    }
}
