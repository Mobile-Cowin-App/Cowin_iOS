//
//  CWStateCoreDataHelper.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 31/05/21.
//

import UIKit
import CoreData
import CWNetworkSDK

class CWStateCoreDataHelper: NSObject {
    
    private static var entityName: String {
        return "State"
    }
    
    static func syncStatesToCoreData(with model: CWStateModel) {
        var coredata = CWCoreDataManager.init()
        let context = coredata.persistentContainer.viewContext
        
        model.states.forEach({
            let stateObject = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as? State
            
            stateObject?.id = Int16($0.stateID)
            stateObject?.name = $0.stateName
        })
        
        coredata.saveContext()
    }
    
    static func getAllStates(sortBy: String = .defaultValue, ascending: Bool = true) -> [State] {
        var coredata = CWCoreDataManager.init()
        let context = coredata.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<State> = State.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        
        if sortBy.isNotEmpty {
            let sort = NSSortDescriptor(key: sortBy, ascending: ascending)
            fetchRequest.sortDescriptors = [sort]
        }
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed")
            return .defaultValue
        }
    }
    
    static func deleteValues() -> Void {
        var coredata = CWCoreDataManager.init()
        let context = coredata.persistentContainer.viewContext
        do {
            let fetchRequest: NSFetchRequest<State> = State.fetchRequest()
            let result = try context.fetch(fetchRequest)
        
            result.forEach({
                context.delete($0)
            })
            coredata.saveContext()
            print("deleted and saved")
        } catch {
            print("save error!")
            return
        }
    }
}
