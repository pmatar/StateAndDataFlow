//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Paul Matar on 18/05/2022.
//

import Foundation

final class UserManager: ObservableObject {
    @Published var isRegistered = false {
        didSet{
            StorageManager.standard.save(isRegistered, for: .registerKey)
        }
    }
    var name = "" {
        didSet{
            StorageManager.standard.save(name, for: .nameKey)
        }
    }
    
    init() {
        if let bool: Bool = StorageManager.standard.fetch(for: .registerKey) {
            isRegistered = bool
        }
        if let string: String = StorageManager.standard.fetch(for: .nameKey) {
            name = string
        }
    }
}
