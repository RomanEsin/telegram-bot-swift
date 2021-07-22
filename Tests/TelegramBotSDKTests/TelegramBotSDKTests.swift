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

    let botToken = "1916636333:AAHDzlsi8MGp8CVjUYSn16fUA3YizTw1RKg"

    func testGetBot() throws {
        let bot = TelegramBot(token: botToken, fetchBotInfo: false)

        guard let botUser: User = bot.requestSync("getMe") else {
            XCTAssert(false, "Bot user is nil")
            return
        }

        XCTAssertEqual(botUser.username, "asap_feedback_local_bot")
    }

    func testSendMessage() throws {
        let bot = TelegramBot(token: botToken)
        let msg = bot.sendMessageSync(chatId: .chat(440740323), text: "Hello, world!")
        XCTAssertNotNil(msg)
    }

    func testSendImage() throws {
        let bot = TelegramBot(token: botToken)
        
    }

    // Finish this test later
//    func testGetUpdates() throws {
//        let bot = TelegramBot(token: botToken)
//        let router = Router(bot: bot)
//
//        let msg = bot.sendMessageSync(chatId: .chat(440740323), text: "Starting bot tests!")
//        XCTAssertNotNil(msg)
//
//        if let update = bot.nextUpdateSync() {
//            try router.process(update: update)
//        } else {
//            XCTAssert(false, "Bot update is nil")
//        }
//    }
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
