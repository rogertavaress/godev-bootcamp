//
//  ManagedObjectContext.swift
//  aula09
//
//  Created by Rogério Tavares on 17/03/22.
//

import Foundation
import UIKit
import CoreData

typealias onCompletionHandler = (String) -> Void

protocol managedProtocol {
    func getUsers() -> [User]
}

protocol managedSaveProtocol {
    func save(_ user: User, onCompletionHandler: onCompletionHandler)
}

protocol managedDeleteProtocol {
    func delete(id: String, onCompletionHandler: onCompletionHandler)
}

class ManagedObjectContext: managedProtocol, managedSaveProtocol, managedDeleteProtocol {
    
    private let entityName = "Users"
    
    static var shared: ManagedObjectContext = {
        let instance = ManagedObjectContext()
        return instance
    }()
    
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func getUsers() -> [User] {
        var list = [User]()
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
        do {
            guard let users = try getContext().fetch(fetchRequest) as? [NSManagedObject] else { return list }
            
            for item in users {
                if let id = item.value(forKey: "id") as? UUID,
                   let name = item.value(forKey: "name") as? String,
                   let lastName = item.value(forKey: "lastName") as? String,
                   let age = item.value(forKey: "age") as? Int {
                    let user = User(id: id, name: name, lastName: lastName, age: age)
                    list.append(user)
                }
                
            }
            
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
        
        return list
    }
    
    func save(_ user: User, onCompletionHandler: (String) -> Void) {
        let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: context) else { return }
        
        let transaction = NSManagedObject(entity: entity, insertInto: context)
        
        transaction.setValue(user.id, forKey: "id")
        transaction.setValue(user.name, forKey: "name")
        transaction.setValue(user.lastName, forKey: "lastName")
        transaction.setValue(user.age, forKey: "age")
        
        do {
            try context.save()
            
            onCompletionHandler("Save Success")
        }catch let error as NSError {
            print("Could not save - \(error.localizedDescription)")
        }
    }
    
    func delete(id: String, onCompletionHandler: (String) -> Void) {
        let context = getContext()
        
        let predicate = NSPredicate(format: "id == %@", "\(id)")
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
        
        fetchRequest.predicate = predicate
        
        do {
            let fetchResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            
            if let entityDelete = fetchResults.first {
                context.delete(entityDelete)
            }
            
            try context.save()
            
            onCompletionHandler("Delete Success")
            
        } catch let error as NSError {
            print("Fetch failed - \(error.localizedDescription)")
        }
    }
    
    
}
