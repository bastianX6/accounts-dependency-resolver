# accounts-dependency-resolver

This package contains logic to create and manage availability of dependencies in [accounts](https://github.com/bastianX6/accounts) app and its modules.

# Overview

The module is composed by two parts:

- A `DependencyResolverProtocol` protocol and a public implementation (`DependencyResolver`) with two responsibilities:
  - Define the availability of a dependency
  - Get a dependency
- A set of availability protocols.

## Availability Protocols

There are two protocols to define dependencies availability:

- `DataSourceAvailability` to define if `DataSourceRead` and `DataSourceModify` are available to be used.
- `ResourcesAvailability` to define if income and expenditure data is available.


# Package dependencies

- [DataManagement](https://github.com/bastianX6/accounts-data-management)
- [AccountsCoreDataManagement](https://github.com/bastianX6/accounts-coredata-management)
- [AccountsUI](https://github.com/bastianX6/accounts-ui)

## Documentation
You can check documentation [here](https://bastianx6.github.io/accounts-dependency-resolver/)