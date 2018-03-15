//
//  Test_motriciteDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Test_motriciteDAO {
    
    static func getNewTest_motricite() -> Test_motriciteDAO?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Test_motriciteDAO", in: ManageCoreData.context) else{
            return nil
        }
        let test = Test_motriciteDAO(entity: entity, insertInto: ManageCoreData.context)
        return test
    }
    
    static func getAll() throws -> [Test_motriciteDAO] {
        let request : NSFetchRequest<Test_motriciteDAO> = Test_motriciteDAO.fetchRequest()
        do {
            let testL = try ManageCoreData.context.fetch(request)
            return testL
        } catch let error as NSError {
            throw error
        }
    }
}
