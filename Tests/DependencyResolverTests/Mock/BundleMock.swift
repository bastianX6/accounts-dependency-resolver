//
//  File.swift
//
//
//  Created by Bastián Véliz Vega on 09-10-20.
//

import Foundation

class BundleMock: Bundle {
    override func url(forResource name: String?, withExtension ext: String?) -> URL? {
        let thisSourceFile = URL(fileURLWithPath: #file)
        let thisDirectory = thisSourceFile.deletingLastPathComponent()
        let resourceURL = thisDirectory
            .appendingPathComponent("Json", isDirectory: true)
            .appendingPathComponent(name ?? "")
            .appendingPathExtension(ext ?? "")

        return resourceURL
    }
}
