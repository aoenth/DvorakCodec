//
//  dv.swift
//  
//
//  Created by Peng, Kevin [C] on 2023-03-23.
//

import Foundation
import DvorakCodec
import Pasteboard
import ArgumentParser

@main
struct Main: ParsableCommand {
    @Flag(name: .shortAndLong)
    var decode: Bool = false

    @Flag(name: .shortAndLong)
    var transformPasteboard: Bool = false

    func run() throws {
        let operation = decode ? String.dvorakDecoded : String.dvorakEncoded

        if transformPasteboard {
            let pasteboardContent = getPasteboardContent()
            setPasteboardContent(transform(string: pasteboardContent, operation: operation))
        } else {
            try fileIO(operation: operation)
        }
    }

    private func fileIO(operation: (String) -> () -> String) throws {
        let stdi = FileHandle.standardInput
        let stdo = FileHandle.standardOutput

        let data = try read(stdi: stdi)
        let string = makeString(data)
        let transformed = transform(string: string, operation: operation)
        let outputData = makeData(transformed)
        try write(stdo: stdo, data: outputData)
    }

    private func read(stdi: FileHandle) throws -> Data {
        if #available(macOS 10.15.4, *) {
            return try stdi.readToEnd() ?? Data("".utf8)
        } else {
            return stdi.readDataToEndOfFile()
        }
    }

    private func write(stdo: FileHandle, data: Data) throws {
        if #available(macOS 10.15.4, *) {
            try stdo.write(contentsOf: data)
        } else {
            stdo.write(data)
        }
    }

    private func makeString(_ data: Data) -> String {
        String(data: data, encoding: .utf8) ?? ""
    }

    private func makeData(_ string: String) -> Data {
        Data(string.utf8)
    }

    private func transform(string: String, operation: (String) -> () -> String) -> String {
        let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
        return operation(trimmed)()
    }
}
