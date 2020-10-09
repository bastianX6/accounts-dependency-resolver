import AccountsCoreDataManagement
import AccountsUI
@testable import DependencyResolver
import XCTest

final class DependencyResolverTests: XCTestCase {
    var sut: DependencyResolver!

    override func setUp() {
        self.sut = DependencyResolver(bundle: BundleMock())
    }

    // MARK: - Test availability

    func testSetDataSourceAvailability() throws {
        let dataType = DataSourceAvailabilityMock.self
        self.sut.setDataSourceAvailability(DataSourceAvailabilityMock(),
                                           forType: dataType)

        let readDataSource = try self.sut.getDataSourceRead(forType: dataType)
        let modifyDataSource = try self.sut.getDataSourceModify(forType: dataType)

        XCTAssert(type(of: readDataSource) == CoreDataSourceRead.self)
        XCTAssert(type(of: modifyDataSource) == CoreDataSourceModify.self)
    }

    func testSetResourcesAvailability() throws {
        let dataType = ResourcesAvailabilityMock.self
        self.sut.setResourcesAvailability(ResourcesAvailabilityMock(),
                                          forType: dataType)

        let incomesResources = try self.sut.getIncomeResources(forType: dataType)
        let expensesResources = try self.sut.getExpeditureResources(forType: dataType)

        XCTAssert(type(of: incomesResources) == MovementResources.self)
        XCTAssert(type(of: expensesResources) == MovementResources.self)
    }

    // MARK: - Test errors

    func testDataSourceAvailabilityNotSet() throws {
        let dataType = DataSourceAvailabilityMock.self

        XCTAssertThrowsError(try self.sut.getDataSourceRead(forType: dataType),
                             "Should throw an error") { error in
            XCTAssertEqual(error as? DependencyResolverError, DependencyResolverError.availabilityNotSet)
        }

        XCTAssertThrowsError(try self.sut.getDataSourceModify(forType: dataType),
                             "Should throw an error") { error in
            XCTAssertEqual(error as? DependencyResolverError, DependencyResolverError.availabilityNotSet)
        }
    }

    func testDataSourceNotAvailable() throws {
        let availabilty = DataSourceAvailabilityMock()
        availabilty.modifyDataSourceAvailable = false
        availabilty.readDataSourceAvailable = false
        let dataType = DataSourceAvailabilityMock.self

        self.sut.setDataSourceAvailability(availabilty,
                                           forType: dataType)

        XCTAssertThrowsError(try self.sut.getDataSourceRead(forType: dataType),
                             "Should throw an error") { error in
            XCTAssertEqual(error as? DependencyResolverError, DependencyResolverError.notAvailable)
        }

        XCTAssertThrowsError(try self.sut.getDataSourceModify(forType: dataType),
                             "Should throw an error") { error in
            XCTAssertEqual(error as? DependencyResolverError, DependencyResolverError.notAvailable)
        }
    }

    func testResourcesAvailabilityNotSet() throws {
        let dataType = ResourcesAvailabilityMock.self

        XCTAssertThrowsError(try self.sut.getIncomeResources(forType: dataType),
                             "Should throw an error") { error in
            XCTAssertEqual(error as? DependencyResolverError, DependencyResolverError.availabilityNotSet)
        }

        XCTAssertThrowsError(try self.sut.getExpeditureResources(forType: dataType),
                             "Should throw an error") { error in
            XCTAssertEqual(error as? DependencyResolverError, DependencyResolverError.availabilityNotSet)
        }
    }

    func testResourcesNotAvailable() throws {
        let availabilty = ResourcesAvailabilityMock()
        availabilty.incomeResourcesAvailable = false
        availabilty.expensesResourcesAvailable = false
        let dataType = ResourcesAvailabilityMock.self

        self.sut.setResourcesAvailability(availabilty,
                                          forType: dataType)

        XCTAssertThrowsError(try self.sut.getIncomeResources(forType: dataType),
                             "Should throw an error") { error in
            XCTAssertEqual(error as? DependencyResolverError, DependencyResolverError.notAvailable)
        }

        XCTAssertThrowsError(try self.sut.getExpeditureResources(forType: dataType),
                             "Should throw an error") { error in
            XCTAssertEqual(error as? DependencyResolverError, DependencyResolverError.notAvailable)
        }
    }
}
