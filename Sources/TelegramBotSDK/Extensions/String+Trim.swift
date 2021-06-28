//
// String+Trim.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

extension String {
    public func trimmed(set: CharacterSet = CharacterSet.whitespacesAndNewlines) -> String {
        return trimmingCharacters(in: set)
    }
}
