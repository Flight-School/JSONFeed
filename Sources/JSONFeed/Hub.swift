import Foundation

public struct Hub: Codable, Equatable {
    /// The type of hub.
    public var type: String
    
    /// The URL for the hub.
    public var url: URL
    
    // MARK: -
    
    public init(type: String, url: URL) {
        self.type = type
        self.url = url
    }
    
    // MARK: Codable
    
    private enum CodingKeys: String, CodingKey {
        case type
        case url
    }
}
