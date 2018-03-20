// Telegram Bot SDK for Swift (unofficial).
// This file is autogenerated by API/generate_wrappers.rb script.

import Foundation
import Dispatch

public extension TelegramBot {
    typealias UnbanChatMemberCompletion = (_ result: Bool?, _ error: DataTaskError?) -> ()

    /// Use this method to unban a previously kicked user in a supergroup or channel. The user will not return to the group or channel automatically, but will be able to join via link, etc. The bot must be an administrator for this to work. Returns True on success.
    /// - Parameters:
    ///     - chat_id: Unique identifier for the target group or username of the target supergroup or channel (in the format @username)
    ///     - user_id: Unique identifier of the target user
    /// - Returns: Bool on success. Nil on error, in which case `TelegramBot.lastError` contains the details.
    /// - Note: Blocking version of the method.
    ///
    /// - SeeAlso: <https://core.telegram.org/bots/api#unbanchatmember>
    @discardableResult
    public func unbanChatMemberSync(
            chatId: ChatId,
            userId: Int64,
            _ parameters: [String: Any?] = [:]) -> Bool? {
        return requestSync("unbanChatMember", defaultParameters["unbanChatMember"], parameters, [
            "chat_id": chatId,
            "user_id": userId])
    }

    /// Use this method to unban a previously kicked user in a supergroup or channel. The user will not return to the group or channel automatically, but will be able to join via link, etc. The bot must be an administrator for this to work. Returns True on success.
    /// - Parameters:
    ///     - chat_id: Unique identifier for the target group or username of the target supergroup or channel (in the format @username)
    ///     - user_id: Unique identifier of the target user
    /// - Returns: Bool on success. Nil on error, in which case `error` contains the details.
    /// - Note: Asynchronous version of the method.
    ///
    /// - SeeAlso: <https://core.telegram.org/bots/api#unbanchatmember>
    public func unbanChatMemberAsync(
            chatId: ChatId,
            userId: Int64,
            _ parameters: [String: Any?] = [:],
            queue: DispatchQueue = .main,
            completion: UnbanChatMemberCompletion? = nil) {
        return requestAsync("unbanChatMember", defaultParameters["unbanChatMember"], parameters, [
            "chat_id": chatId,
            "user_id": userId],
            queue: queue, completion: completion)
    }
}

