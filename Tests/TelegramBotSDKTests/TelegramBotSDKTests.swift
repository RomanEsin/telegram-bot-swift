//
// TelegramBot.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

import XCTest
@testable import TelegramBotSDK

class TelegramBotTests: XCTestCase {
    var logger: (_ text: Any?) -> () = {

        print("[TEST LOGGER]: \($0 ?? "nil")")
    }

    let botToken = "1902701325:AAHvOTL-RqJDo8gLtImcaot-Hzu7bh9lo6o"

    func testGetBot() {
        let bot = TelegramBot(token: botToken, fetchBotInfo: false)

        guard let botUser: User = bot.requestSync("getMe") else {
            XCTAssert(false, "Bot user is nil")
            return
        }

        XCTAssertEqual(botUser.username, "asap_feedback_dev_bot")
    }

    func testSendMessage() {
        let bot = TelegramBot(token: botToken)
        let msg = bot.sendMessageSync(chatId: .chat(440740323), text: "Hello, world!")
        XCTAssertNotNil(msg)
    }
}

#if os(Linux)
extension TelegramBotTests {
    static var allTests : [(String, (TelegramBotTests) -> () throws -> Void)] {
        return [
            ("testCreateBot", testCreateBot),
        ]
    }
}
#endif