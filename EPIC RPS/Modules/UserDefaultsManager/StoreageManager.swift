import Foundation
//MARK: - protocol StoreageManagerProtocol
protocol StoreageManagerProtocol {
    func set(object: Any?, forKey key: StoreageManager.Keys)
    func int(forKey key: StoreageManager.Keys) -> Int?
    func string(forKey key: StoreageManager.Keys) -> String?
    func dict(forKey key: StoreageManager.Keys) -> [String: Any]?
    func date(forKey key: StoreageManager.Keys) -> Date?
    func bool(forKey key: StoreageManager.Keys) -> Bool?
}

//MARK: - class StoreageManager

final class StoreageManager: ObservableObject {
    public enum Keys: String {
     
        case twoPlayer
        case melody
        case time
        case playerOneCountWinsGames
        case playerTwoCountWinsGames
        case playerOneCountLooseGames
        case playerTwoCountLooseGames
    }

    //MARK: - propetris
    private let userDefaults = UserDefaults.standard
    
    //MARK: - methods
    private func store(object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }
    
    private func restore(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
}

//MARK: - extension StoreageManagerProtocol
extension StoreageManager: StoreageManagerProtocol {
    func set(object: Any?, forKey key: Keys) {
        store(object: object, key: key.rawValue)
    }
    
    func int(forKey key: Keys) -> Int? {
        restore(forKey: key.rawValue) as? Int
    }
    
    func string(forKey key: Keys) -> String? {
        restore(forKey: key.rawValue) as? String
    }
    
    func dict(forKey key: Keys) -> [String : Any]? {
        restore(forKey: key.rawValue) as? [String: Any]
    }
    
    func date(forKey key: Keys) -> Date? {
        restore(forKey: key.rawValue) as? Date
    }
    
    func bool(forKey key: Keys) -> Bool? {
        restore(forKey: key.rawValue) as? Bool
    }
    
    func remove(forKey key: Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}
