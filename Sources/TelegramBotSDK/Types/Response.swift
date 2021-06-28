//
// Response.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation


/// Response to Bot API request.
public struct Response<T: Decodable>: Decodable {
    
	/// If `ok` equals true, the request was successful and the result of the query can be found in the `result` field. In case of an unsuccessful request, ‘ok’ equals false and the error is explained in the ‘errorDescription’.
	public var ok: Bool
    /// *Optional.* Error description.
	public var description: String?
    /// *Optional.* Error code. Its contents are subject to change in the future.
	public var errorCode: Int?
    /// *Optional.* Result.
	internal var result: T?
}
