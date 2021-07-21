//
//  File.swift
//  
//
//  Created by Роман Есин on 22.07.2021.
//

import Foundation
import TelegramBotSDK

let bot = TelegramBot(token: "token")
let router = Router(bot: bot) {
    CommandHandler("start") { context in
        context.respondSync("Hello!")
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
