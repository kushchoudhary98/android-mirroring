//
//  Command.swift
//  Android Mirroring
//
//  Created by Kush Choudhary on 05/07/25.
//

import Foundation

func runCommand(_ command: [String]) async -> [String] {
    let task = Process()
    task.launchPath = command.first
    task.arguments = Array(command.dropFirst())

    let pipe = Pipe()
    task.standardOutput = pipe

    do {
        try task.run()
    } catch {
        return ["Error"]
    }

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8) ?? ""
    return output.components(separatedBy: [" ", "\n", "\t"])
}
