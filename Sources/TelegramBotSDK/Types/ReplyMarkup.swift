//
// ReplyMarkup.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

public enum ReplyMarkup: Codable {
    case inlineKeyboardMarkup(InlineKeyboardMarkup)
    case replyKeyboardMarkup(ReplyKeyboardMarkup)
    case replyKeyboardRemove(ReplyKeyboardRemove)
    case forceReply(ForceReply)
    case unknown
    
    public init(from decoder: Decoder) throws {
        if let inlineKeyboardMarkup = try? decoder.singleValueContainer().decode(InlineKeyboardMarkup.self) {
            self = .inlineKeyboardMarkup(inlineKeyboardMarkup)
            return
        }

        if let replyKeyboardMarkup = try? decoder.singleValueContainer().decode(ReplyKeyboardMarkup.self) {
            self = .replyKeyboardMarkup(replyKeyboardMarkup)
            return
        }
        
        if let replyKeyboardRemove = try? decoder.singleValueContainer().decode(ReplyKeyboardRemove.self) {
            self = .replyKeyboardRemove(replyKeyboardRemove)
            return
        }
        
        if let forceReply = try? decoder.singleValueContainer().decode(ForceReply.self) {
            self = .forceReply(forceReply)
            return
        }
        
        self = .unknown
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .inlineKeyboardMarkup(inlineKeyboardMarkup):
            try container.encode(inlineKeyboardMarkup)
        case let .replyKeyboardMarkup(replyKeyboardMarkup):
            try container.encode(replyKeyboardMarkup)
        case let .replyKeyboardRemove(replyKeyboardRemove):
            try container.encode(replyKeyboardRemove)
        case let .forceReply(forceReply):
            try container.encode(forceReply)
        default:
            fatalError("Unknown should not be used")
        }
    }
}
