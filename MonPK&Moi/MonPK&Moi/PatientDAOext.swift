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
    
    static func save(){
        do{
            try ManageCoreData.context.save()
        }catch{
        }
    }
    
    static func createDAO() -> PatientDAO{
        return PatientDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forBirthdate birthdate: Date, forLastname lastname: String, forFirstname firstname: String, forPrepareTime prepareTime: Int64) -> PatientDAO{
        let dao = self.createDAO()
        dao.nom=lastname
        dao.prenom=firstname
        dao.date_naissance=birthdate as NSDate
        dao.temps_preparation=prepareTime
        
        self.save()
        
        return dao
    }
    
    static func searchDAO(forBirthdate birthdate: Date, forLastname lastname: String, forFirstname firstname: String, forPrepareTime prepareTime: Int64) -> PatientDAO?{
        let request : NSFetchRequest<PatientDAO> = NSFetchRequest<PatientDAO>()
        request.predicate = NSPredicate(format: "nom == %@ AND prenom == %@ AND date_naissance == %@ AND temps_preparation == %@", firstname, lastname, birthdate as CVarArg, prepareTime)
        do{
            let result = try ManageCoreData.context.fetch(request) as [PatientDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }
    
    static func deleteDAO(ForPatient patient: PatientDAO){
        ManageCoreData.context.delete(patient)
        self.save()
    }
    
    static func getAll() throws -> [Patient]{
        var list: [Patient] = []
        let request : NSFetchRequest<PatientDAO> = NSFetchRequest<PatientDAO>()
        do{
            let result = try ManageCoreData.context.fetch(request) as [PatientDAO]
            for nb in 1...result.count{
                let pat = Patient(forDate: result[nb].date_naissance! as Date,forNom: result[nb].nom!,forPrenom: result[nb].prenom!,forTempsPreparation: result[nb].temps_preparation)
                list.append(pat)
            }
        }
        catch{
            throw error
        }
        return list
    }
    
}
