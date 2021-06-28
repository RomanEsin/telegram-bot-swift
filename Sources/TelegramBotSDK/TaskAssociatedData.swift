//
// TaskAssociatedData.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

public class TaskAssociatedData {
    /// If no networking errors occur and the data returned by the server
    /// is parsed successfully, this handler will be called
    internal var completion: TelegramBot.DataTaskCompletion?
    
    /// Current number of reconnect attempts
    public var retryCount: Int = 0
    
    init(_ completion: @escaping TelegramBot.DataTaskCompletion = { _, _ in }) {
        self.completion = completion
    }
}
