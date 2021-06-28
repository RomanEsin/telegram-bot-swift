//
// BotName.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

public class BotName {
    let underscoreBotSuffix = "_bot"
    let botSuffix = "bot"
    public var withoutSuffix: String

    public init(username: String) {
        let lowercase = username.lowercased()
        if lowercase.hasSuffix(underscoreBotSuffix) {
			withoutSuffix = String(username.dropLast(underscoreBotSuffix.count))
        } else if lowercase.hasSuffix(botSuffix) {
			withoutSuffix = String(username.dropLast(botSuffix.count))
        } else {
            withoutSuffix = username
        }
    }


}

extension BotName: Equatable {
}

public func ==(lhs: BotName, rhs: BotName) -> Bool {
    return lhs.withoutSuffix == rhs.withoutSuffix
}

extension BotName: Comparable {
}

public func <(lhs: BotName, rhs: BotName) -> Bool {
    return lhs.withoutSuffix < rhs.withoutSuffix
}
