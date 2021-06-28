//
// TelegramBot+Utils.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

extension TelegramBot {
	public static var unhandledErrorText = "❗ Error while performing the operation."

    @discardableResult
    public func reportErrorSync(chatId: Int64, text: String, errorDescription: String) -> Message? {
		logger("ERROR: \(errorDescription)")
        return sendMessageSync(chatId: .chat(chatId), text: text)
    }
	
    @discardableResult
	public func reportErrorSync(chatId: Int64, errorDescription: String) -> Message? {
		logger("ERROR: \(errorDescription)")
        return sendMessageSync(chatId: .chat(chatId), text: TelegramBot.unhandledErrorText)
	}
	
	public func reportErrorAsync(chatId: Int64, text: String, errorDescription: String, completion: SendMessageCompletion? = nil) {
		logger("ERROR: \(errorDescription)")
        sendMessageAsync(chatId: .chat(chatId), text: text, completion: completion)
	}
	
	public func reportErrorAsync(chatId: Int64, errorDescription: String, completion: SendMessageCompletion? = nil) {
		logger("ERROR: \(errorDescription)")
        sendMessageAsync(chatId: .chat(chatId), text: TelegramBot.unhandledErrorText, completion: completion)
	}
}
