//
//  MovementResourcesReeader.swift
//
//
//  Created by Bastián Véliz Vega on 08-10-20.
//

import Foundation

import AccountsUI
import Foundation

class MovementResourcesReeader {
    private let incomeDataFileName = "IncomeData"
    private let expenditureDataFileName = "ExpeditureData"
    private let fileExtension = "json"

    private let bundle: Bundle

    init(bundle: Bundle) {
        self.bundle = bundle
    }

    func readIncomeData() throws -> MovementResources {
        return try self.readData(fileName: self.incomeDataFileName)
    }

    func readExpenditureData() throws -> MovementResources {
        return try self.readData(fileName: self.expenditureDataFileName)
    }

    private func readData(fileName: String) throws -> MovementResources {
        guard let url = self.bundle.url(forResource: fileName,
                                        withExtension: self.fileExtension) else {
            fatalError("Can't data url for file: \(fileName)")
        }
        let data = try Data(contentsOf: url)
        let entity = try JSONDecoder().decode(MovementResources.self, from: data)

        return entity
    }
}
