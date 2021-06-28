//
// ChatId.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

public enum ChatId: Codable {
    case channel(String)
    case chat(Int64)
    case unknown
    
    public init(from decoder: Decoder) throws {
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .channel(string)
            return
        }

        if let int64 = try? decoder.singleValueContainer().decode(Int64.self) {
            self = .chat(int64)
            return
        }
        
        self = .unknown
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .channel(string):
            try container.encode(string)
        case let .chat(int64):
            try container.encode(int64)
        default:
            fatalError("Unknown should not be used")
        }
    }
}
