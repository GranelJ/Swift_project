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
    
    static func getNewRdv() -> RdvDAO?{
        guard let entity = NSEntityDescription.entity(forEntityName: "RdvDAO", in: ManageCoreData.context) else{
            return nil
        }
        let rdv = RdvDAO(entity: entity, insertInto: ManageCoreData.context)
        return rdv
    }
    
    static func getAll() throws -> [RdvDAO] {
        let request : NSFetchRequest<RdvDAO> = RdvDAO.fetchRequest()
        do {
            let rdvL = try ManageCoreData.context.fetch(request)
            return rdvL
        } catch let error as NSError {
            throw error
        }
    }
}
