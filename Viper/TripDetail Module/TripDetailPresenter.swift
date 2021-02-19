
import SwiftUI
import Combine

class TripDetailPresenter: ObservableObject {
    private let interactor: TripDetailInteractor
    
    private var cancellables = Set<AnyCancellable>()
    @Published var tripName: String = "No Name"
    let setTripName: Binding<String>
    
    init(interactor: TripDetailInteractor) {
        self.interactor = interactor
        
        setTripName = Binding<String>(
            get: { interactor.tripName },
            set: { interactor.setTripName($0) }
        )
        
        interactor.tripNamePublisher
            .assign(to: \.tripName, on: self)
            .store(in: &cancellables)
    }
    
    func save() {
      interactor.save()
    }
}


