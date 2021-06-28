//
// ChatMember+Utils.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

extension ChatMember {
	public enum Status: String, Codable {
		case creator
		case administrator
		case member
        case restricted
		case left
		case kicked
	}
}

	
