//
// InputFile.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

/// Represents the contents of a file to be uploaded. Must be posted using multipart/form-data in the usual way that files are uploaded via the browser..
/// - SeeAlso: <https://core.telegram.org/bots/api#inputfile>

public class InputFile: Codable {
    var filename: String
    var data: Data
    var mimeType: String?
    
    public init(filename: String, data: Data, mimeType: String? = nil) {
        self.filename = filename
        self.data = data
        self.mimeType = mimeType
    }
}
