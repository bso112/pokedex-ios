//
//  Log.swift
//  Pokedex
//
//  Created by Byeon Seonguk on 2022/09/07.
//

import Foundation

final class Log {

    /// LOG [DEBUG]
    static func d(_ msg: Any, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
            let fileName = file.split(separator: "/").last ?? ""
            let funcName = function.split(separator: "(").first ?? ""
            print("""

                🍏🍏🍏🍏🍏
                [\(fileName)] \(funcName) (line.\(line)): \(msg)
                """)
        #endif
    }

    /// LOG [INFO]
    static func i(_ msg: Any, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
            let fileName = file.split(separator: "/").last ?? ""
            let funcName = function.split(separator: "(").first ?? ""
            print("""

            🍊🍊🍊🍊🍊
            [\(fileName)] \(funcName) (line.\(line)): \(msg)
            """)
        #endif
    }

    /// LOG [ERROR]
    static func e(_ msg: Any, file: String = #file, function: String = #function, line: Int = #line) {
        let fileName = file.split(separator: "/").last ?? ""
        let funcName = function.split(separator: "(").first ?? ""
        print("""

        🍎🍎🍎🍎🍎
        [\(fileName)] \(funcName) (line.\(line)): \(msg)
        """)
    }
}
