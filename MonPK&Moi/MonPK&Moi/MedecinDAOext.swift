//
//  MedecinDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension MedecinDAO {
    
    static func getNewMedecin() -> MedecinDAO?{
        guard let entity = NSEntityDescription.entity(forEntityName: "MedecinDAO", in: ManageCoreData.context) else{
            return nil
        }
        let medecin = MedecinDAO(entity: entity, insertInto: ManageCoreData.context)
        return medecin
    }
    
    static func getAll() throws -> [MedecinDAO] {
        let request : NSFetchRequest<MedecinDAO> = MedecinDAO.fetchRequest()
        do {
            let medecinL = try ManageCoreData.context.fetch(request)
            return medecinL
        } catch let error as NSError {
            throw error
        }
    }
}
