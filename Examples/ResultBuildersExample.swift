//
// ResultBuildersExample.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation
import TelegramBotSDK

let bot = TelegramBot(token: "token")
let router = Router(bot: bot) {
    CommandHandler("start") { context in
        context.respondSync("Hello!")
        return true
    }

    CommandsHandler {
        "help"
        "help2"
        "help3"
    } handler: { context in
        context.respondAsync(context.command)
        return true
    }

    ContentTypeHandler(contentType: .replyToMessage) { context in
        context.respondSync("Test message")
        return true
    }
}

while let update = bot.nextUpdateSync() {
    try router.process(update: update)
}

fatalError("Server stopped due to error: \(bot.lastError)")
