import Foundation

protocol DataStoreProtocol {
    func save(_ value: Any?, forKey key: String)
    func retrieveInteger(forKey key: String) -> Int
    func deleteObject(forKey key: String)
    func deleteAllObjects()
}

struct DataStore: DataStoreProtocol {
    static let shared = DataStore()
    private let defaults = UserDefaults.standard

    func save(_ value: Any?, forKey key: String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    func retrieveInteger(forKey key: String) -> Int {
        defaults.integer(forKey: key)
    }
    
    func retrieveString(forKey key: String) -> String? {
        defaults.string(forKey: key)
    }
    
    func deleteObject(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
    
    func deleteAllObjects() {
        if let appDomain = Bundle.main.bundleIdentifier {
                    defaults.removePersistentDomain(forName: appDomain)
                    defaults.synchronize()
        }
    }
}
