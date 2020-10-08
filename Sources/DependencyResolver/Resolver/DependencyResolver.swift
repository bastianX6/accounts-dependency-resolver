//
//  DependencyResolver.swift
//
//
//  Created by Bastián Véliz Vega on 08-10-20.
//

import AccountsCoreDataManagement
import AccountsUI
import DataManagement
import Foundation

/// Default implementation of `DependencyResolverProtocol`
public class DependencyResolver: DependencyResolverProtocol {
    private var dataSourceAvailabilty: [String: DataSourceAvailability] = [:]
    private var resourcesAvailabilty: [String: ResourcesAvailability] = [:]

    private let dataSourceRead: DataSourceRead = CoreDataSourceRead()
    private let dataSourceModify: DataSourceModify = CoreDataSourceModify()
    private let resourcesReader: MovementResourcesReeader

    /// Default initializer
    /// - Parameter bundle: bundle where resources are located
    public init(bundle: Bundle) {
        self.resourcesReader = MovementResourcesReeader(bundle: bundle)
    }

    // MARK: - Setup availability

    // Set availability configuration for data sources
    /// - Parameters:
    ///   - availability: availability configuration
    ///   - type: the type of value to set up availability
    public func setDataSourceAvailability<T>(_ availability: DataSourceAvailability, forType type: T.Type) {
        self.dataSourceAvailabilty[String(describing: type.self)] = availability
    }

    /// Set availability configuration for data sources
    /// - Parameters:
    ///   - availability: availability configuration
    ///   - type: the type of value to set up availability
    public func setResourcesAvailability<T>(_ availability: ResourcesAvailability, forType type: T.Type) {
        self.resourcesAvailabilty[String(describing: type.self)] = availability
    }

    // MARK: - Get data sources

    /// Get a `DataSourceRead` instance
    /// - Parameter type: the type of value to get the object
    /// - Throws:
    ///   - `DependencyResolverError.availabilityNotSet` if availability wasn't configured
    ///   - `DependencyResolverError.notAvailable` if resource is not available
    /// - Returns: An object that implements the  `DataSourceRead` interface
    public func getDataSourceRead<T>(forType type: T.Type) throws -> DataSourceRead {
        guard let availability = self.dataSourceAvailabilty[String(describing: type.self)] else {
            throw DependencyResolverError.availabilityNotSet
        }

        guard availability.availability(for: .read) else {
            throw DependencyResolverError.notAvailable
        }

        return self.dataSourceRead
    }

    /// Get a `DataSourceModify` instance
    /// - Parameter type: the type of value to get the object
    /// - Throws:
    ///   - `DependencyResolverError.availabilityNotSet` if availability wasn't configured
    ///   - `DependencyResolverError.notAvailable` if resource is not available
    /// - Returns: An object that implements the  `DataSourceModify` interface
    public func getDataSourceModify<T>(forType type: T.Type) throws -> DataSourceModify {
        guard let availability = self.dataSourceAvailabilty[String(describing: type.self)] else {
            throw DependencyResolverError.availabilityNotSet
        }

        guard availability.availability(for: .modify) else {
            throw DependencyResolverError.notAvailable
        }

        return self.dataSourceModify
    }

    // MARK: - Get resources

    /// Get a `MovementResources` instance with income categories and stores
    /// - Parameter type: the type of value to get the object
    /// - Throws:
    ///   - `DependencyResolverError.availabilityNotSet` if availability wasn't configured
    ///   - `DependencyResolverError.notAvailable` if resource is not available
    /// - Returns: A `MovementResources` instance
    public func getIncomeResources<T>(forType type: T.Type) throws -> MovementResources {
        guard let availability = self.resourcesAvailabilty[String(describing: type.self)] else {
            throw DependencyResolverError.availabilityNotSet
        }

        guard availability.availability(for: .incomesData) else {
            throw DependencyResolverError.notAvailable
        }

        return try self.resourcesReader.readIncomeData()
    }

    /// Get a `MovementResources` instance with expediture categories and stores
    /// - Parameter type: the type of value to get the object
    /// - Throws:
    ///   - `DependencyResolverError.availabilityNotSet` if availability wasn't configured
    ///   - `DependencyResolverError.notAvailable` if resource is not available
    /// - Returns: A `MovementResources` instance
    public func getExpeditureResources<T>(forType type: T.Type) throws -> MovementResources {
        guard let availability = self.resourcesAvailabilty[String(describing: type.self)] else {
            throw DependencyResolverError.availabilityNotSet
        }

        guard availability.availability(for: .incomesData) else {
            throw DependencyResolverError.notAvailable
        }

        return try self.resourcesReader.readExpeditureData()
    }
}
