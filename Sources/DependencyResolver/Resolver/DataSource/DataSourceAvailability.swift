//
//  DataSourceAvailability.swift
//
//
//  Created by Bastián Véliz Vega on 08-10-20.
//

import Foundation

/// Defines the way to check if a data source is available
public protocol DataSourceAvailability {
    /// Check if a data source is available to use
    /// - Parameter type: data source type
    func availability(for type: DataSourceType) -> Bool
}
