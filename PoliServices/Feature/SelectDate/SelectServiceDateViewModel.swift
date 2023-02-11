import Foundation

protocol SelectServiceDateViewModelProtocol {
    func saveNewService(with name: String?, and date: Double)
    func selectDate() -> Date
}

final class SelectServiceDateViewModel: SelectServiceDateViewModelProtocol {
    private let dataStore = DataStore.shared
    
    func saveNewService(with name: String?, and date: Double) {
        dataStore.save(name, forKey: Constants.serviceName.rawValue)
        dataStore.save(date, forKey: Constants.serviceDate.rawValue)
    }
    
    func selectDate() -> Date {
        let today = Date()
        let minutesAfterNow = 1
        guard let selectedDate = Calendar.current.date(byAdding: .minute, value: minutesAfterNow, to: today) else { return Date() }
            return selectedDate
    }
}

