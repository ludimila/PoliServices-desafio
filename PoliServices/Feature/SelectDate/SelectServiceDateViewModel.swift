import Foundation

protocol SelectServiceDateViewModelProtocol {
    func saveService(with name: String?, and date: Double)
    func selectDate() -> Date
}

final class SelectServiceDateViewModel: SelectServiceDateViewModelProtocol {
    private let dataStore = DataStore.shared
    
    func saveService(with name: String?, and date: Double) {
        let service = SelectedService(name: name, date: date)
        dataStore.save(service.name, forKey: Constants.serviceName.rawValue)
        dataStore.save(service.date, forKey: Constants.serviceDate.rawValue)
    }
    
    func selectDate() -> Date {
        let day = Date()
        let minutesAfterNow = 1
        guard let selectedDate = Calendar.current.date(byAdding: .minute, value: minutesAfterNow, to: day) else { return Date() }
            return selectedDate
    }
}

