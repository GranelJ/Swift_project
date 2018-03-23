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
    
    static func createDAO(forDate date: Date,forLibelle libelle: String) -> RdvDAO{
        let dao = self.createDAO()
        dao.date_rdv=date as NSDate
        dao.libelle=libelle
        
        self.save()
        
        return dao
    }
    
    static func searchDAO(forDate date: Date,forLibelle libelle: String) -> RdvDAO?{
        let request : NSFetchRequest<RdvDAO> = NSFetchRequest<RdvDAO>()
        request.predicate = NSPredicate(format: "date_rdv == %@ AND libelle == %@", date as CVarArg, libelle)
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
        let request : NSFetchRequest<RdvDAO> = NSFetchRequest<RdvDAO>()
        do{
            let result = try ManageCoreData.context.fetch(request) as [RdvDAO]
            for nb in 1...result.count{
                let synthese = Synthese(forHeureDebut: (result[nb].rdv_synthese?.heure_debut)!, forHeureFin: (result[nb].rdv_synthese?.heure_fin)!, forPeriodicite: (result[nb].rdv_synthese?.periodicite)!)
                let medecin = Medecin(forEmail: (result[nb].rdv_medecin?.email)!, forLieu: (result[nb].rdv_medecin?.lieu_travail)!, forNom: (result[nb].rdv_medecin?.nom)!, forPrenom: (result[nb].rdv_medecin?.prenom)!, forProfession: (result[nb].rdv_medecin?.profession)!, forTelephone: (result[nb].rdv_medecin?.telephone)!)
                let rdv = Rdv(forDate: (result[nb].date_rdv!) as Date,forLibelle: result[nb].libelle!,forMedecin: medecin ,forSynthese: synthese)
                list.append(rdv)
            }
        }
        catch{
            throw error
        }
        return list
    }
}
