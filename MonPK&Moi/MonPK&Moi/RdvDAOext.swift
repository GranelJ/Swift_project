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
    
    static func save(){
        do{
            try ManageCoreData.context.save()
        }catch{
        }
    }
    
    static func createDAO() -> RdvDAO{
        return RdvDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forDate date: Date,forLibelle libelle: String, forMedecin medecin: MedecinDAO) -> RdvDAO{
        let dao = self.createDAO()
        dao.date_rdv=date as NSDate
        dao.libelle=libelle
        dao.rdv_medecin = medecin
            
        self.save()
        
        return dao
    }
    
    static func searchDAO(forDate date: Date,forLibelle libelle: String, forMedecin medecinName: String) -> RdvDAO?{
        let request : NSFetchRequest<RdvDAO> = NSFetchRequest<RdvDAO>(entityName: "RdvDAO")
        request.predicate = NSPredicate(format: "date_rdv == %@ AND libelle == %@ AND rdv_medecin.nom == %@", date as CVarArg, libelle, medecinName)
        do{
            let result = try ManageCoreData.context.fetch(request) as [RdvDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }
    
    static func deleteDAO(ForRdv rdv: RdvDAO){
        ManageCoreData.context.delete(rdv)
        self.save()
    }
    
    static func getAll() throws -> [Rdv]{
        var list: [Rdv] = []
        let request : NSFetchRequest<RdvDAO> = NSFetchRequest<RdvDAO>(entityName: "RdvDAO")
        do{
            let result = try ManageCoreData.context.fetch(request) as [RdvDAO]
            if (result.count>0) {
                for nb in 1...result.count{
                   // let synthese = Synthese(forHeureDebut: (result[nb-1].rdv_synthese?.heure_debut)!, forHeureFin: (result[nb-1].rdv_synthese?.heure_fin)!, forPeriodicite: (result[nb-1].rdv_synthese?.periodicite)!)
                    let rdv = Rdv(forDate: (result[nb-1].date_rdv!) as Date, forLibelle: result[nb-1].libelle!,forMedecin: result[nb-1].rdv_medecin! ,forSynthese: nil) //TODO pb rdv_medcin nil lorsque quitte app et reviens
                    list.append(rdv)
                }
            }
        }
        catch{
            throw error
        }
        return list
    }
}
