//
//  MedicamentDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension MedicamentDAO {
    
    static func save(){
        do{
            try ManageCoreData.context.save()
        }catch{
        }
    }
    
    static func createDAO() -> MedicamentDAO{
        return MedicamentDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forDesc desc_med: String,forDosage dosage: String,forNom nom: String) -> MedicamentDAO{
        let dao = self.createDAO()
        dao.desc_med=desc_med
        dao.dosage=dosage
        dao.nom=nom
        
        self.save()
        
        return dao
    }
    
    static func searchDAO(forDesc desc_med: String,forDosage dosage: String,forNom nom: String) -> MedicamentDAO?{
        let request : NSFetchRequest<MedicamentDAO> = NSFetchRequest<MedicamentDAO>(entityName: "MedicamentDAO")
        request.predicate = NSPredicate(format: "desc_med == %@ AND dosage == %@ AND nom == %@", desc_med, dosage, nom)
        do{
            let result = try ManageCoreData.context.fetch(request) as [MedicamentDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }
    
    static func deleteDAO(ForMedicament medicament: MedicamentDAO){
        ManageCoreData.context.delete(medicament)
        self.save()
    }
    
    static func getAll() throws -> [Medicament]{
        var list: [Medicament] = []
        let request : NSFetchRequest<MedicamentDAO> = NSFetchRequest<MedicamentDAO>(entityName: "MedicamentDAO")
        do{
            let result = try ManageCoreData.context.fetch(request) as [MedicamentDAO]
            if (result.count>0) {
                for nb in 1...result.count{
                    let med = Medicament(forDesc: result[nb-1].desc_med!,forDosage: result[nb-1].dosage!,forNom: result[nb-1].nom!)
                    list.append(med)
                }
            }
        }
        catch{
            throw error
        }
        return list
    }
}
