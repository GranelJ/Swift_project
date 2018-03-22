//
//  Contact_persoDAO.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Contact_persoDAO {
    
    static func save(){
        do{
            try ManageCoreData.context.save()
        }catch{
        }
    }
    
    static func createDAO() -> Contact_persoDAO{
        return Contact_persoDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forEmail email: String, forNom nom: String, forPrenom prenom: String, forTelephone telephone: String) -> Contact_persoDAO{
        let dao = self.createDAO()
        dao.email=email
        dao.nom=nom
        dao.prenom=prenom
        dao.telephone=telephone
        
        self.save()
        
        return dao
    }
    
    static func searchDAO(forEmail email: String, forNom nom: String, forPrenom prenom: String, forTelephone telephone: String) -> Contact_persoDAO?{
        let request : NSFetchRequest<Contact_persoDAO> = NSFetchRequest<Contact_persoDAO>()
        request.predicate = NSPredicate(format: "email == %@ AND nom == %@ AND prenom == %@ AND telephone == %@", email, nom, prenom, telephone)
        do{
            let result = try ManageCoreData.context.fetch(request) as [Contact_persoDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }

}
