import Foundation

public struct Author: Codable, Equatable {
    /**
     The author's name.
     */
    public var name: String?
    
    /**
     The URL of a site owned by the author.
     
     The URL could be a blog, micro-blog, Twitter account, and so on.
     Ideally the linked-to page provides a way to contact the author,
     but that's not required.
     The URL could be a `mailto:` link,
     though we suspect that will be rare.
     */
    public var url: URL?
    
    /**
     The URL for an image for the author.
     
     As with `icon`, it should be square and relatively large —
     such as 512 x 512 — and should use transparency where appropriate,
     since it may be rendered on a non-white background.
     */
    public var avatar: URL?
    
    // MARK: -
    
    public init?(name: String? = nil, url: URL? = nil, avatar: URL?) {
        if name == nil && url == nil && avatar == nil {
            return nil
        }
        
        self.name = name
        self.url = url
        self.avatar = url
    }
    
    // MARK: Codable
    
    private enum CodingKeys: String, CodingKey {
        case name
        case url
        case avatar
    }
}
