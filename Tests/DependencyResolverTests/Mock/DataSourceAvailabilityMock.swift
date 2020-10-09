//
//  File.swift
//
//
//  Created by Bastián Véliz Vega on 09-10-20.
//

@testable import DependencyResolver
import Foundation

class DataSourceAvailabilityMock: DataSourceAvailability {
    var readDataSourceAvailable: Bool = true
    var modifyDataSourceAvailable: Bool = true

    func availability(for type: DataSourceType) -> Bool {
        switch type {
        case .read:
            return self.readDataSourceAvailable
        case .modify:
            return self.modifyDataSourceAvailable
        }
    }
}
