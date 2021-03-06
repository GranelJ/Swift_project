//
//  EvenementDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension EvenementDAO {
    
    static func save(){
        do{
            try ManageCoreData.context.save()
        }catch{
        }
    }
    
    static func createDAO() -> EvenementDAO{
        return EvenementDAO(context: ManageCoreData.context)
    }
    
    static func createDAO(forDate date_evt: Date,forDesc desc_evt: String,forType type: String) -> EvenementDAO{
        let dao = self.createDAO()
        dao.date_evt=date_evt as NSDate
        dao.desc_evt=desc_evt
        dao.type=type
        
        self.save()
        
        return dao
    }
    
    static func searchDAO(forDate date_evt: Date,forDesc desc_evt: String,forType type: String) -> EvenementDAO?{
        let request : NSFetchRequest<EvenementDAO> = NSFetchRequest<EvenementDAO>(entityName: "EvenementDAO")
        request.predicate = NSPredicate(format: "date_evt == %@ AND desc_evt == %@ AND type == %@", date_evt as CVarArg, desc_evt, type)
        do{
            let result = try ManageCoreData.context.fetch(request) as [EvenementDAO]
            guard result.count != 0 else { return nil }
            return result.first
        }
        catch{
            return nil
        }
    }
    
    static func deleteDAO(ForEvenement evenement: EvenementDAO){
        ManageCoreData.context.delete(evenement)
        self.save()
    }
    
    static func getAll() throws -> [Evenement]{
        var list: [Evenement] = []
        let request : NSFetchRequest<EvenementDAO> = NSFetchRequest<EvenementDAO>(entityName: "EvenementDAO")
        do{
            let result = try ManageCoreData.context.fetch(request) as [EvenementDAO]
            if (result.count>0) {
                for nb in 1...result.count{
                    let evt = Evenement(forDate: result[nb-1].date_evt! as Date,forDesc: result[nb-1].desc_evt!,forType: result[nb-1].type!)
                    list.append(evt)
                }
            }
        }
        catch{
            throw error
        }
        return list
    }
}
