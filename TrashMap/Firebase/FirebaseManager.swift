//
//  FirebaseManager.swift
//  TrashMap
//
//  Created by Павел Кай on 27.04.2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
final class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    let db = Firestore.firestore()
    
    private init() { }
    
    func getTrashItems() async throws {
        let docRef = db.collection(FirebaseCollectionNames.trashItems).document("Trash")
        
        let snapshot = try await docRef.getDocument(as: Trash.self)
        
        print(snapshot)
    }
    
}
