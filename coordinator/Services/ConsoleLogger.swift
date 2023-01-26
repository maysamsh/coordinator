//
//  ConsoleLogger.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-25.
//

import Foundation
import OSLog

struct ConsoleLogger {
    static func log(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
        let fileURL = URL.init(fileURLWithPath: file)
        let pathExtension = fileURL.pathExtension
        let fileName = "\(URL(fileURLWithPath: file).deletingPathExtension().lastPathComponent).\(pathExtension)"
        let logMessage = "\(message): \(fileName), \(function) line #\(line)"
        os_log("%{public}@", log: .default, type: .info, logMessage)
        #endif
    }
    
    static func classDeInitialized(file: String = #file) {
        #if DEBUG
        let fileURL = URL.init(fileURLWithPath: file)
        let pathExtension = fileURL.pathExtension
        let fileName = "\(URL(fileURLWithPath: file).deletingPathExtension().lastPathComponent).\(pathExtension)"
        print("\(fileName) is de-initialized.")
        #endif
    }
}
