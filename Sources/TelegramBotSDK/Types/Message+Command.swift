//
// Message+Command.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

extension Message {
	public func extractCommand(for bot: TelegramBot) -> String? {
		return text?.without(botName: bot.name) ?? nil
	}
	
	public func addressed(to bot: TelegramBot) -> Bool {
		guard let text = text else { return true }
		return text.without(botName: bot.name) != nil
	}
}
