//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Paul Matar on 21/05/2022.
//

import Foundation
import CoreVideo

final class StorageManager {
    static let standard = StorageManager()
    
    private let userDefaults = UserDefaults.standard

    private init() {}
    
    func save<T>(_ data: T, for key: Keys) {
        userDefaults.set(data, forKey: key.rawValue)
    }
    
    func fetch<T>(for key: Keys) -> T? {
        switch key {
        case .registerKey:
            return userDefaults.bool(forKey: key.rawValue) as? T
        case .nameKey:
            return userDefaults.string(forKey: key.rawValue) as? T
        }
    }
}

extension StorageManager {
    enum Keys: String {
        case registerKey = "isRegistered"
        case nameKey = "name"
    }
}
