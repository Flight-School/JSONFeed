import Foundation

public struct Feed: Codable, Equatable {
    /// JSON Feed Version 1
    public static let v1 = URL(string: "https://jsonfeed.org/version/1")!
    
    /**
     The URL of the version of the format the feed uses.
     
     This should appear at the very top,
     though we recognize that not all JSON generators allow for ordering.
     */
    public var version: URL
    
    /**
     The name of the feed, which will often correspond
     to the name of the website (blog, for instance),
     though not necessarily.
     */
    public var title: String
    
    /**
     The URL of the resource that the feed describes.
     
     This resource may or may not actually be a "home" page,
     but it should be an HTML page. If a feed is published on the public web,
     this should be considered as required.
     But it may not make sense in the case
     of a file created on a desktop computer,
     when that file is not shared or is shared only privately.
     */
    public var homePageURL: URL?
    
    /**
     The URL of the feed, serving as the unique identifier for the feed.
     
     As with `homePageURL`,
     this should be considered required for feeds on the public web.
     */
    public var feedURL: URL?
    
    /**
     Provides more detail, beyond the title,
     on what the feed is about.
     
     A feed reader may display this text.
     */
    public var description: String?
    
    /**
     A description of the purpose of the feed.
     
     This is for the use of people looking at the raw JSON,
     and should be ignored by feed readers.
     */
    public var userComment: String?
    
    /**
     The URL of a feed that provides the next `n` items,
     where `n` is determined by the publisher.
     This allows for pagination, but with the expectation that
     reader software is not required to use it
     and probably won't use it very often.
     
     - Warning: `nextURL` must not be the same as `feedURL`,
                and it must not be the same as a previous `nextURL`
                (to avoid infinite loops).
     */
    public var nextURL: URL?
    
    /**
     The URL of an image for the feed suitable to be used in a timeline,
     much the way an avatar might be used.
     
     The avatar should be square and relatively large — such as 512 x 512 —
     so that it can be scaled-down and so that
     it can look good on retina displays.
     It should use transparency where appropriate,
     since it may be rendered on a non-white background.
     */
    public var icon: URL?
    
    /**
     The URL of an image for the feed suitable to be used in a source list.
     
     The favicon should be square and relatively small,
     but not smaller than 64 x 64 (so that it can look good on retina displays).
     As with `icon`, this image should use transparency where appropriate,
     since it may be rendered on a non-white background.
     */
    public var favicon: URL?
    
    /**
     The feed author.
     */
    public var author: Author?
    
    
    /**
     Whether or not the feed is finished — that is,
     whether or not it will ever update again.
     
     A feed for a temporary event,
     such as an instance of the Olympics, could expire.
     */
    public var expired: Bool?
    
    /**
     Endpoints that can be used to subscribe to real-time notifications
     from the publisher of this feed.
     */
    public var hubs: [Hub]?
    
    /**
     The items in the feed.
     */
    public var items: [Item]
    
    // MARK: -
    
    public init(version: URL = Feed.v1,
                title: String,
                homePageURL: URL? = nil,
                feedURL: URL? = nil,
                description: String? = nil,
                userComment: String? = nil,
                nextURL: URL? = nil,
                icon: URL? = nil,
                favicon: URL? = nil,
                author: Author? = nil,
                expired: Bool? = nil,
                hubs: [Hub]? = nil,
                items: [Item])
    {
        self.version = version
        self.title = title
        self.homePageURL = homePageURL
        self.feedURL = feedURL
        self.description = description
        self.userComment = userComment
        self.nextURL = nextURL
        self.icon = icon
        self.favicon = favicon
        self.author = author
        self.expired = expired
        self.hubs = hubs
        self.items = items
    }
    
    // MARK: Codable
    
    private enum CodingKeys: String, CodingKey {
        case version
        case title
        case homePageURL = "home_page_url"
        case feedURL = "feed_url"
        case description
        case userComment = "user_comment"
        case nextURL = "next_url"
        case icon
        case favicon
        case author
        case expired
        case hubs
        case items
    }
}


