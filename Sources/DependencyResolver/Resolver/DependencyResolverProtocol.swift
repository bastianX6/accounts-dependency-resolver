//
//  DependencyResolverProtocol.swift
//
//
//  Created by Bastián Véliz Vega on 08-10-20.
//

import AccountsUI
import DataManagement
import Foundation

/// Defines the way to resolve and get dependencies
public protocol DependencyResolverProtocol: ObservableObject {
    /// Set availability configuration for data sources
    /// - Parameters:
    ///   - availability: availability configuration
    ///   - type: the type of value to set up availability
    func setDataSourceAvailability<T>(_ availability: DataSourceAvailability, forType type: T.Type)

    /// Set availability configuration for data sources
    /// - Parameters:
    ///   - availability: availability configuration
    ///   - type: the type of value to set up availability
    func setResourcesAvailability<T>(_ availability: ResourcesAvailability, forType type: T.Type)

    /// Get a `DataSourceRead` instance
    /// - Parameter type: the type of value to get the object
    func getDataSourceRead<T>(forType type: T.Type) throws -> DataSourceRead

    /// Get a `DataSourceModify` instance
    /// - Parameter type: the type of value to get the object
    func getDataSourceModify<T>(forType type: T.Type) throws -> DataSourceModify

    /// Get a `MovementResources` instance with income categories and stores
    /// - Parameter type: the type of value to get the object
    func getIncomeResources<T>(forType type: T.Type) throws -> MovementResources

    /// Get a `MovementResources` instance with expenditure categories and stores
    /// - Parameter type: the type of value to get the object
    func getExpenditureResources<T>(forType type: T.Type) throws -> MovementResources

    /// Application appearance
    var appearance: Appearance { get }
}
