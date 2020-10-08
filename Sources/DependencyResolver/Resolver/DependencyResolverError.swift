//
//  DependencyResolverError.swift
//
//
//  Created by Bastián Véliz Vega on 08-10-20.
//

import Foundation

/// Dependency resolver errors
public enum DependencyResolverError: Error {
    /// The request object is not available
    case notAvailable

    /// The availability configuration is not set
    case availabilityNotSet
}
