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
        
        return dao
    }
    
    static func searchDAO(forEmail email: String,forLieu lieu_travail: String,forNom nom: String,forPrenom prenom: String,forProfession profession: String,forTelephone telephone: String) -> MedecinDAO?{
        let request : NSFetchRequest<MedecinDAO> = NSFetchRequest<MedecinDAO>()
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
}
