//
// ChatType.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

public enum ChatType: String, Codable {
    case privateChat = "private"
    case group
    case supergroup
    case channel
}
