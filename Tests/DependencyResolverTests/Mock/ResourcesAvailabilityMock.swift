//
//  ResourcesAvailabilityMock.swift
//
//
//  Created by Bastián Véliz Vega on 09-10-20.
//

@testable import DependencyResolver
import Foundation

class ResourcesAvailabilityMock: ResourcesAvailability {
    var incomeResourcesAvailable: Bool = true
    var expensesResourcesAvailable: Bool = true

    func availability(for type: ResourceType) -> Bool {
        switch type {
        case .incomesData:
            return self.incomeResourcesAvailable
        case .expensesData:
            return self.expensesResourcesAvailable
        }
    }
}
