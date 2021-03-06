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
    
    static func save(){
        do{
            try ManageCoreData.context.save()
        }catch{
        }
    }
    
    static func createDAO() -> MedecinDAO{
        return MedecinDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forEmail email: String,forLieu lieu_travail: String,forNom nom: String,forPrenom prenom: String,forProfession profession: String,forTelephone telephone: String) -> MedecinDAO{
        let dao = self.createDAO()
        dao.email=email
        dao.lieu_travail=lieu_travail
        dao.nom=nom
        dao.prenom=prenom
        dao.profession=profession
        dao.telephone=telephone
        
        self.save()
        
        return dao
    }
    
    static func searchDAO(forEmail email: String,forLieu lieu_travail: String,forNom nom: String,forPrenom prenom: String,forProfession profession: String,forTelephone telephone: String) -> MedecinDAO?{
        let request : NSFetchRequest<MedecinDAO> = NSFetchRequest<MedecinDAO>(entityName: "MedecinDAO")
        request.predicate = NSPredicate(format: "email == %@ AND lieu_travail == %@ AND nom == %@ AND prenom == %@ AND profession == %@ AND telephone == %@", email, lieu_travail, nom, prenom, profession, telephone)
        do{
            let result = try ManageCoreData.context.fetch(request) as [MedecinDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }
    
    static func deleteDAO(ForMedecin medecin: MedecinDAO){
        ManageCoreData.context.delete(medecin)
        self.save()
    }
    
    static func getAll() throws -> [Medecin]{
        var list: [Medecin] = []
        let request : NSFetchRequest<MedecinDAO> = NSFetchRequest<MedecinDAO>(entityName: "MedecinDAO")
        do{
            let result = try ManageCoreData.context.fetch(request) as [MedecinDAO]
            if (result.count>0) {
                for nb in 1...result.count{
                    let med = Medecin(forEmail: result[nb-1].email!,forLieu: result[nb-1].lieu_travail!,forNom: result[nb-1].nom!,forPrenom: result[nb-1].prenom!,forProfession: result[nb-1].profession!,forTelephone: result[nb-1].telephone!)
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
