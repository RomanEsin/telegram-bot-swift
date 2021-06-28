//
// InputFileOrString.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

public enum InputFileOrString: Codable {
    case inputFile(InputFile)
    case string(String)
    
    case unknown
    
    public init(from decoder: Decoder) throws {
        if let inputFile = try? decoder.singleValueContainer().decode(InputFile.self) {
            self = .inputFile(inputFile)
            return
        }

        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        
        self = .unknown
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .inputFile(inputFile):
            try container.encode(inputFile)
        case let .string(string):
            try container.encode(string)
        default:
            fatalError("Unknown should not be used")
        }
    }
}
