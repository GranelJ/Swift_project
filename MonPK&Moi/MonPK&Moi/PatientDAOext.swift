//
//  PatientModel.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 14/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension PatientDAO {
    
    static func getNewPatient() -> PatientDAO?{
        guard let entity = NSEntityDescription.entity(forEntityName: "PatientDAO", in: ManageCoreData.context) else{
            return nil
        }
        let patient = PatientDAO(entity: entity, insertInto: ManageCoreData.context)
        return patient
    }
    
    static func get() throws -> PatientDAO? {
        let request : NSFetchRequest<PatientDAO> = PatientDAO.fetchRequest()
        do {
            let patientL = try ManageCoreData.context.fetch(request)
            return patientL.first
        } catch let error as NSError {
            throw error
        }
    }
    
    static func exist() throws -> Bool {
        do{
            guard try(self.get() != nil) else {
                return false
            }
            return true
        }catch let error as NSError{
            throw error
        }
    }
    
}
