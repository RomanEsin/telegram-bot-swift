// Telegram Bot SDK for Swift (unofficial).
// This file is autogenerated by API/generate_wrappers.rb script.

import Foundation
import SwiftyJSON

/// This object represents a venue.
///
/// - SeeAlso: <https://core.telegram.org/bots/api#venue>

public struct Venue: JsonConvertible {
    /// Original JSON for fields not yet added to Swift structures.
    public var json: JSON

    /// Venue location
    public var location: Location {
        get { return Location(json: json["location"]) }
        set { json["location"] = newValue.json }
    }

    /// Name of the venue
    public var title: String {
        get { return json["title"].stringValue }
        set { json["title"].stringValue = newValue }
    }

    /// Address of the venue
    public var address: String {
        get { return json["address"].stringValue }
        set { json["address"].stringValue = newValue }
    }

    /// Optional. Foursquare identifier of the venue
    public var foursquareId: String? {
        get { return json["foursquare_id"].string }
        set { json["foursquare_id"].string = newValue }
    }

    public init(json: JSON = [:]) {
        self.json = json
    }
}
