//
//  TraitementDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension TraitementDAO {
    
    static func save(){
        do{
            try ManageCoreData.context.save()
        }catch{
        }
    }
    
    static func createDAO() -> TraitementDAO{
        return TraitementDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forDateDebut dateDebut: Date,forDateFin dateFin: Date,forFrequence frequence: Int64, forMomentPrise momentPrise: String) -> TraitementDAO{
        let dao = self.createDAO()
        dao.date_debut=dateDebut as NSDate
        dao.date_fin=dateFin as NSDate
        dao.frequence=frequence
        dao.moment_de_prise=momentPrise
        
        self.save()
        
        return dao
    }
    
    static func searchDAO(forDateDebut dateDebut: Date,forDateFin dateFin: Date,forFrequence frequence: Int64, forMomentPrise momentPrise: String) -> TraitementDAO?{
        let request : NSFetchRequest<TraitementDAO> = NSFetchRequest<TraitementDAO>()
        request.predicate = NSPredicate(format: "date_debut == %@ AND date_fin == %@ AND frequence == %@ AND moment_de_prise == %@", dateDebut as CVarArg, dateFin as CVarArg, frequence, momentPrise)
        do{
            let result = try ManageCoreData.context.fetch(request) as [TraitementDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }
    
    static func deleteDAO(ForTraitement traitement: TraitementDAO){
        ManageCoreData.context.delete(traitement)
        self.save()
    }
}
