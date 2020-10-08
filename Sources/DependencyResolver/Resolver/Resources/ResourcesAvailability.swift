//
//  ResourcesAvailability.swift
//  
//
//  Created by Bastián Véliz Vega on 08-10-20.
//

import Foundation

/// Defines the way to check if a resource is available
public protocol ResourcesAvailability {
    /// Check if a  resource is available to use
    /// - Parameter type: resource type
    func availability(for type: ResourceType) -> Bool
}
