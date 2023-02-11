import Foundation

protocol NewServiceViewModelProtocol {
    var numberOfServices: Int { get }
    func currentService(_ index: Int) -> NewServiceModel
    func selectService(service: NewServiceModel)
    func selectedServiceName() -> String?
}

final class NewServiceViewModel: NewServiceViewModelProtocol {
    
    private var selectedService: NewServiceModel?
    
    var numberOfServices: Int {
        return createServices().count
    }

    func currentService(_ index: Int) -> NewServiceModel {
        return createServices()[index]
    }

    func selectService(service: NewServiceModel) {
        selectedService = service
    }

    func selectedServiceName() -> String? {
        return selectedService?.name
    }
    
    private func createServices() -> [NewServiceModel] {
        let services = [
            NewServiceModel(name: "Código", icon: "pencil.slash"),
            NewServiceModel(name: "Carreira", icon: "graduationcap.circle.fill"),
            NewServiceModel(name: "Entrevista", icon: "books.vertical.fill"),
            NewServiceModel(name: "Feedback", icon: "scribble.variable")
        ]
        return services
    }
    
}
