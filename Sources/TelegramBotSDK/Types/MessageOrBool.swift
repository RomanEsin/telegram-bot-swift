//
// MessageOrBool.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation


public enum MessageOrBool: Codable {
    case message(Message)
    case bool(Bool)
    case unknown
    
    public init(from decoder: Decoder) throws {
        if let message = try? decoder.singleValueContainer().decode(Message.self) {
            self = .message(message)
            return
        }

        if let bool = try? decoder.singleValueContainer().decode(Bool.self) {
            self = .bool(bool)
            return
        }
        
        self = .unknown
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .message(message):
            try container.encode(message)
        case let .bool(bool):
            try container.encode(bool)
        default:
            fatalError("Unknown should not be used")
        }
    }
}
