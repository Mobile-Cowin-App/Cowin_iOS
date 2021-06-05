//
//  CWDistrictCoreDataHelper.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 03/06/21.
//

import UIKit
import CoreData
import CWNetworkSDK

class CWDistrictCoreDataHelper: NSObject {
    
    private static var entityName: String {
        return "District"
    }
    
    static func syncDistrictsToCoreData(with model: CWDistrictModel) {
        var coredata = CWCoreDataManager.init()
        let context = coredata.persistentContainer.viewContext
        
        model.districts.forEach({
            let districtObject = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as? District
            
            districtObject?.id = Int16($0.districtID)
            districtObject?.name = $0.districtName
        })
        
        coredata.saveContext()
    }
    
    static func getAllDistricts(from stateId: String, sortBy: String = .defaultValue, ascending: Bool = true) -> [District] {
        var coredata = CWCoreDataManager.init()
        let context = coredata.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<District> = District.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate(format: "id == [c] %@", stateId)
        
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
            let fetchRequest: NSFetchRequest<District> = District.fetchRequest()
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
