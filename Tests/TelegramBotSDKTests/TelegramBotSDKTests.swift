//
// TelegramBot.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

import XCTest
@testable import TelegramBotSDK

class TelegramBotTests: XCTestCase {
    func logger(_ text: Any?, _nilDescription: String) {
        print("[TEST LOGGER]: \(text ?? "nil")")
    }

    func logger(_ text: Any) {
        print("[TEST LOGGER]: \(text)")
    }

    let botToken = "1916636333:AAHDzlsi8MGp8CVjUYSn16fUA3YizTw1RKg"
    let testChat = ChatId.chat(440740323)

    func testGetBot() throws {
        let bot = TelegramBot(token: botToken, fetchBotInfo: false)

        guard let botUser: User = bot.requestSync("getMe") else {
            XCTAssert(false, "Bot user is nil")
            return
        }

        XCTAssertEqual(botUser.username, "asap_feedback_local_bot")
        logger(botUser)
    }

    func testSendMessage() throws {
        let bot = TelegramBot(token: botToken)
        let msg = bot.sendMessageSync(chatId: testChat, text: "Hello, world!")
        XCTAssertNotNil(msg)
        logger(msg, _nilDescription: "Msg = nil")
    }

    func testSendImage() throws {
        let bot = TelegramBot(token: botToken)
        guard let data = Data(base64Encoded: testImageString) else {
            XCTAssert(false, "Couldn't create data")
            return
        }

        let msg = bot.sendPhotoSync(chatId: testChat, photo: .inputFile(.init(filename: "cat", data: data, mimeType: "JPEG")))
        XCTAssertNotNil(msg)
        logger(msg, _nilDescription: "Msg = nil")
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

    let testImageString = """
/9j/4AAQSkZJRgABAQAAYABgAAD/4QCMRXhpZgAATU0AKgAAAAgABQESAAMAAAABAAEAAAEaAAUAAAABAAAASgEbAAUAAAABAAAAUgEoAAMAAAABAAIAAIdpAAQAAAABAAAAWgAAAAAAAABgAAAAAQAAAGAAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAA9CgAwAEAAAAAQAAAiUAAAAA/+0AOFBob3Rvc2hvcCAzLjAAOEJJTQQEAAAAAAAAOEJJTQQlAAAAAAAQ1B2M2Y8AsgTpgAmY7PhCfv/AABEIAiUD0AMBIgACEQEDEQH/xAAfAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgv/xAC1EAACAQMDAgQDBQUEBAAAAX0BAgMABBEFEiExQQYTUWEHInEUMoGRoQgjQrHBFVLR8CQzYnKCCQoWFxgZGiUmJygpKjQ1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4eLj5OXm5+jp6vHy8/T19vf4+fr/xAAfAQADAQEBAQEBAQEBAAAAAAAAAQIDBAUGBwgJCgv/xAC1EQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2wBDABwcHBwcHDAcHDBEMDAwRFxEREREXHRcXFxcXHSMdHR0dHR0jIyMjIyMjIyoqKioqKjExMTExNzc3Nzc3Nzc3Nz/2wBDASIkJDg0OGA0NGDmnICc5ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubm5ub/3QAEAD3/2gAMAwEAAhEDEQA/AFoooqRi0UUUAFFFFAC0UUUAFFFFABS0UUAFFFFABS0lFAC0UUUxBRRRQMKKKKAFooooAKKKKACiiigQtFFFABRRRQMKKKKBBRRRQMKKKKACiiigQUUUUDCiiloAKSiigBaKSloAKSlpKAFooooAKKKKACiikoAWiiigAooooAKKKKACikooAWkoooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApKWkoAKKKKACiiigApKWkpAFFFFABRRRQAUUUlABRRRQAUUUUCEooooGFFFFACUUUUAFFFFABSUtJQAUlLSUAFFFFACUUUUAJSUtJQAlJS0lABSUUUAf/QWlpKKkBaKKKBhRRRQAtFFFABRRRQAUtJS0AFFFFABRRRTAKWiigAooooAKKKKAFopKWgAooooAKKKKBBRRRQMWiiigAooooAKKKKACiiigAooooAKKKWkAlFLSUXCwUUtJTAKWkooAKWkooAWkopaACikpaACikpaACiiigAopKKAFopKWgAopKKACiiigAoopwUnpQA2lp5VE5c4pyvEeAalyGokYU4zTasOCBVemmDQUUUUxBRRRQAUUUUAFFFFABRRRQAlFFFABRRRQAUUUlIBaSiigAooooAKKKKACkoooAKKKKACiiigBKKKKACiiigBKKKKACiikoAKKKKACkoooAKKKSgApKWkoAKSlpKAEpKWkoASiiigD//0VpaSipAWiiigYUUUUALRRRQAUUUUAFLSUtABRRRQAUUUUwFooooAKKKKACiiigBaKSloEFFJS0DCiiigQUUUUDFopKWgAooooEFFFFAwooooAKKKKACnKpY4ptTDCRlz1qZDjuQu4Q7V5NR75PWlAyc0/bWRrYYr9nH41JjuOajZfSmgsh4qlIlxJaKUEMMjr6UlaJ3M2gpaSimAUUtJQAUUUUAFFFFAC0lFFAC0lFLQAlLSUtACUtJRQAUUVKij7zdKQAke7k8CmvLj5Y+PekkkLcLwKjVe9ZuRrGJGRnrTSoHNT4prDipKLML+ahRuoqMjFQwttlB9ank+8a0gzOaGUUUVZAUUUUAFFFFABRRRQAlFLSUAFFFFABRRRQAUUlLSASiiigAooooAKKKKAEooooAKKKKACiikoAKKKKACiikoAKKKKACkpaSgAooooASiiigApKWkoAKSlpKAEooooASkpaSgBKKKKAP/9JaWkoqRi0UUUAFFFFAC0UlLQAUUUUAFLSUUALRRRQAUUUUAFFFFMBaKKKACiiigApaSigApaSloAKKKKACiiigQUUUUDFopKWgAooooAKKKKACiiigAp8v+rWmUs/ESiolsVDcagqXFMjAxUlZI2Y01GwzUpphqiSvypyKmVw496YwzUBypyKadhNXLdFRo+8ZqStEzJoKKKKYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFKBk4pAOVc8noKieXecDoKJpAP3a9O9Qr1qGzSKJRTxTBThUli01hTs01iKTGiuDiQD3q9JjNUP+Wgz61fk6iriZ1COiiitDMKKKKACiiigApKWkoAKKKKACiiikAUUUUAFFJRTAKKKKQBRRRQAUUlFABRRRQAUUUUAFJRRQAUUUUAFJRRQAUUUUAFJS0lABRRSUAFFFFABSUUUAFJRRQAlFFJQAUlLSUAJRRRQB//TWiiipGLRRRQAUUUUAFLSUUALRRRQAUUUUALRSUtABRRRQAUUUUwClpKWgAooooAKKKKACiiigBaKKSgBaKKKACiiigApaSigAooooAWiiigAopKWgApZx8i0lOn6LUT2LhuIo4qQZxTB0xUu3is4msmNphp59qYaogaagcGrBqNhmgCqGKNkVbUhhuFVXFNjk2HHammJovUU0HIzTqszCiiimAUUUUAFFFFABRRRQAUUUlIBaJHESYH3jTh8q72rPdzI+41LZUUPwDUyjFRripRUmg6im5NKDSAWom4qQmo2OaCkR4ywx61efPGapKMMDV12zVRIqDKKKKsyCiiigAoopKAFpKKKACiiigAooooAKKKSgAooooAKKKKACiiigApKKKACiiigApKWkoAKKKKACiikoAKKKKACiikoAKKKKAEopaSgAooooASiiigBKKKSgApKWkoASiikoAKKKKAP/9RaKKKkYUUUtABRRRQAUUUUALRSUtABRRRQAUUUUAFLSUtABRRRQAUUUUwClpKKAFooooAKKKKACiiigBaKSigBaKKKACiiigAooooAKKKKACiiigBadLyoplOfJj+lRLYuG4i561PnIxVeNs8VIxxwKziaSAnHFNOaUEUhJpiGnimk0pIqMtTAjeqjHBq23IqnIOaaJZZim/gareRWWJDjB7VNFOoOGpkmhTguag81W6UeeV4NNMVicjFNGDUbN8ufWo1LDmncRaIptVPPO7FNkds8UAXaaTiq8UhI+apEJc7j0ouFiUHNKBzzURkQcelRmfqBUtlJDbifPyjpVdTmmNyuaWMEmiw7lpakFRA4qQEetSUPpM0m4UhcUDAk03NIWB6Uhx1oGPXlxVtqpQ/NJ9KtmqiiJsKKKKozEooopgFFFFIAooooAKKKSgBaKSigAooooAKKKKACiiigApKKKACiiigAoopKACiiigAooooAKSiigAooooASiiigApKWkoAKKKKACkoooAKKKSgApKWkoAKSlpKAEpKWkoAKKKSgD//VKWkpakYUUUUAFLSUtABRRRQAUUUUALRSUtABRRRQAUUUUALRSUUALRRRQAUUUUALSUUUALRSUtMAooooAKKKKAClpKKAFopKKAFooooAKKKKACiiigAqRORio6epwaTGiDOyTipSc1BJy2RQrHpWJ0Cl9vApdxI5pdg60DGcDmmTcbyegpcU7n6UexpiuRMKgaPJB7Vbxxg0nSgTKJjwajIHTvVpzhivbrULEZzVIhjEBBG2rIZdvzVWVtuSaikckUWC5pRMJGwegp9xIEXC1kwswbPpU00hbGadhEnG0N3qeIrIMN1rPLnoO1OjfEnPFDAvMojk5+6asB1xgdKy5pDzzTI5m9aVh3L7rHz60zb2qFnO0UokI/Ciw7kzIOAKSMBQT601XyeamAzjNIA2jFRkGpWI/KmjFBRFhqbhqsfSmkHsaAuRqp70MacQfWm7fWgpEtvw1WzVOEZfirlVEykFJRRTJCiiigAooooAKKKKAEopaSgAooooAKKKKACiikoAKKKKACiiigAoopKACiiigAooooAKSiigAooooAKSiigAoopKACiiigAoopKACiiigApKKKACkoooASiiigBKSlpKACkoooA//9YoooqRi0UlLQAUUUUALSUUUALRSUtABRRRQAtFJRQAtFFFABRRRQAUtJRQAtFJRQAtFFFABRRRQAUtJS0wCiiigAooooAKKKKQBRRRTAKKKKAFooooAKUUn1pwI9KQEZ4f601sA8VO+cbsdKoNKxbk/hWdtTZPQnyD9404N2qsspzgEVMCGOG4NAD+vINGR0qMxkHch/CpPQng0CFz2NQO3alY4OKhPJwaEIZJ8wz6VHzg+1TLgN81RPwSB2NUiWRsMnHpUMpwdoq2SCCaqNhm4qkSx8SMRk9KfJ94VNGvyKBUc4/IUhkTnJGO9BX94KQ9QKfGcygt9KYhZlO2qyVoyAbSO9UjhH46GhDZNjjFANAPzfN0xSjmkAoyOasq4xVcc09gAOOtJlIlJ3HApyiq6naOasKcr6UmMibd2qPkd6mYkj5ahKnvQgGlyKlWTcMVXPtTo+tMLl62HU1ZqOJdq0+miJBRRRTEFFFFABRRRQAlFFFABRRRQAUUUUAFFJRQAtJRRQAUUUUAFFFJQAUUUUAFFFFABSUUUAFFFFABRSUUAFFFFABSUUUAFFFJQAUUUUAFJRRQAUlLSUAFFFJQAUlLSUAJRRSUAFFFFAH/1yikoqRi0UUUAFLSUUALRRRQAUUUUALRSUtABRRRQAUtJRQAtFJS0AFFFFABRRRQAUtJRQAtFJS0AFFFFABRRRQAUtJRQAtFFJQAtFFFABRRS5oAKKSigBaUU2loAmODGazBtLYIrQGSMVnyqUeoZomONuOqmplBAw1JGMjrUuexpDF4AprHAyKGxtqNfun2oEG0E5FMdcEk8VJxzUDPwA1MRE3XPel+U9fpSsQRjv2qDuSaokkC4Q+1Vpk8tsirSneoQU6RNygH0oAhhkxg9adOPlP1zVVCUbFW2G9VHc96AKhxwRT0YbgD3NMPBxSp/rFzTAsynALVTT5mz1xVqcgLioYFyCR1NICUqcUgODg1O3C7fQc1WBGSaAJAQKevzCogpK+56U4HaNo69zQMmIG31pAc8UL0xSjikMeCMUhA6mmgcZp6gGkMgYZpYx81SMM9KWEYfmmIvD7tJTjxTapEsKKKKBBRSUUAFFFFABRRRQAUUUUAFJRRQAUUUUAFFFFABRSUUAFFFFABRRRQAUlFFABRRRQAUlLSUAFFFFABSUUUAFFFJQAtJRRQAUUUlAC0lFFABSUUUAFJRRQAlFFJQAUlLSUAFFFFAH//0EoooqRhS0lFAC0UUUAFFFFAC0UlFAC0UUUALRSUUALRSUtABRRRQAUUUUAFLSUUALRRRQAUUUUAFLSUUALRSUtABRRRQAUUUUAFFFFAC0UlFAC0UUUAFLSUooAmQVWmTc3WrartXJqsyqzZNRItECI6+9SE8c1IVC9KgYnNIYpwRgGkCEdDQq4ORUgBNAEL5Az0qAk4x1q04yvNU5CRwKaEyUKrCoZl2/T1pI3w3WrE4zHmqEUom+bmr7kMm6stCd4xWugDIAaGCMiYFHqeMjj2p06buT2pqAkADrigViN+SWFLGOSx7CnNjAH50bTsyPxoAjuGO7bU1suB9aR04GR1qWJQAPrQAkxKKRVSM5NW7sccVXgX5s+lCAsEbfrUXenuc8moQcnAoGWEqTHf1pqgkVJz2pDGk84pQ3akwaZ8wpASHJ4oX5WBqNSehobIoA1TyM0yiB98eDSmqRLG0tFJTEFFFFABRRRQAUUUUAJRRRQAUUUUAFFFJQAUUUUAFFFFABRRSUALSUUUAFFFFABRSUUAFFFFACUUUUAFFFJQAtJRRQAUUlFABRRRQAUlFFABRRSUAFFFJQAUlLSUAJRRRQAlFFFAH//RbRRRUjFooooAKKKKAFopKKAFooooAKWkooAWikpaACiiigBaKSigBaKSigBaKSloAKKKKAFopKKAFopKWgAooooAKKKKAFopKKAFooooAKKKKAClpKKAFpy9abUsQyaAJ2+7ioCAvJqw9Z88mOlZssjeYk4WlUnPvUMaFznFWRHt6UAOUE8mpdpxTQR0NO4xkmgCJ+OetUipY4IxVmS4iTvVRrrPQU0AhhPXvT0J27W5FRC4I7VKk0bnB4NMRVMZST5enatDO0g+ooChjzUzKCuPak2OxSfG04701CUH8jSyKd4pcj8DTEREDAI/GnLzx60cY9qF5OT0pgCfMP8AdOM1MmO3SmDCjGMUsK8YNJjI7kO3A70RpsTb3NXJFBqElUGWOKVwsRGMtTTGVPFNe5PRRxTPPkPIqhFpUboal2cVR8915IqzHco3B4pMEPIIqLac1KzKelR4z0pDGNkdaUHdTmXI45qNRTEX7bjip3HNU4mw1Xm5GaEDIqKKKokKKKKACikooAWkoooAKKKKACkoooAKKKKACiiigAopKKACiiigAoopKAFpKKKACiikoAWkoooAKKKKACkoooAKKKSgBaSiigApKKKACiiigBKKKKACkoooASiikoAKSlpKACiiigD/0m0UlFSMWiiigBaKSigBaKKKAClpKKAFopKKAFooooAKKKKAFopKKAFopKKAFooooAKKKKAFopKKAFooooAKKKKAFopKKAFopKWgAooooAKWkooAWikpaAFFW4hxmqyirSnApMaGSGsyT5mq7Kx6VVC5aoRZYRQqUxpAp5qKefyxtFZrys5ppCuaDTqKgklaRMjpUCRBuuRVxlwm0CgCnAULEyDOBx9alVNxqtGdkmDV5flOasgzpT+8I9KVAWX3p80ZzkDr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
"""
}

#if os(Linux)
extension TelegramBotTests {
    static var allTests : [(String, (TelegramBotTests) -> () throws -> Void)] {
        return [
            ("testGetBot", testGetBot),
            ("testSendMessage", testSendMessage)
            ("testSendImage", testSendImage)
        ]
    }
}
#endif
