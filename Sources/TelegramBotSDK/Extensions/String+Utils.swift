//
// String+Utils.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

extension String {
    public func hasPrefix(_ prefix: String, caseInsensitive: Bool) -> Bool {
        if caseInsensitive {
            return nil != self.range(of: prefix, options: [.caseInsensitive, .anchored])
        }
        return hasPrefix(prefix)
    }
}
