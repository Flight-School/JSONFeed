import Foundation

public struct Item: Codable, Equatable {
    /**
     A unique identifier for an item in a feed.
     
     If an item is ever updated, the `id` should be unchanged.
     New items should never use a previously-used `id`.
     If an `id` is presented as a number or other type,
     a JSON Feed reader must coerce it to a string.
     Ideally, the `id` is the full URL of the resource described by the item,
     since URLs make great unique identifiers.
     */
    public var id: String
    
    /**
     The URL of the resource described by the item.
     
     It's the permalink.
     This may be the same as the id — but should be present regardless.
     */
    public var url: URL?
    
    /**
     The URL of a page elsewhere.
     
     This is especially useful for linkblogs.
     If url links to where you're talking about a thing,
     then `externalURL` links to the thing you're talking about.
     */
    public var externalURL: URL?
    
    /**
     The title in plain text.
     
     Microblog items in particular may omit titles.
     */
    public var title: String?
    
    /**
     The HTML of the item.
     
     - Important: This is the only place HTML is allowed in this format.
                  A Twitter-like service might use `contentText`,
                  while a blog might use `contentHTML`.
                  Use whichever makes sense for your resource.
                  (It doesn't even have to be the same for each item in a feed.)
     - SeeAlso: `contentText`
     */
    public var contentHTML: String?
    
    /**
     The plain text of the item.
     
     - SeeAlso: `contentHTML`
     */
    public var contentText: String?
    
    /**
     A plain text sentence or two describing the item.
     
     This might be presented in a timeline,
     for instance, where a detail view would display
     all of `contentHTML` or `contentText`.
     */
    public var summary: String?
    
    /**
     The URL of the main image for the item.
     
     This image may also appear in the `contentHTML` — if so,
     it's a hint to the feed reader that this is the main, featured image.
     Feed readers may use the image as a preview
     (probably resized as a thumbnail and placed in a timeline).
     */
    public var image: URL?
    
    /**
     The URL of an image to use as a banner.
     
     Some blogging systems (such as Medium)
     display a different banner image chosen to go with each post,
     but that image wouldn't otherwise appear in the `contentHTML`.
     
     A feed reader with a detail view may choose to show this banner image
     at the top of the detail view,
     possibly with the title overlaid.
     */
    public var bannerImage: URL?
    
    /**
     The publication date.
     */
    public var datePublished: Date?
    
    /**
     The modification date
     */
    public var dateModified: Date?
    
    /**
     The author of the item.
     
     If not specified in an item, then the top-level author, if present,
     is the author of the item.
     */
    public var author: Author?
    
    /**
     Tags related to the item.
     
     Tags tend to be just one word, but they may be anything.
     
     - Note: Tags are not the equivalent of Twitter hashtags.
             Some blogging systems and other feed formats call these categories.
     */
    public var tags: [String]?
    
    /**
     Resources related to the item.
     
     Podcasts, for instance,
     would include an attachment that's an audio or video file.
     */
    public var attachments: [Attachment]?
    
    // MARK: -
    
    public init?(id: String,
                 url: URL? = nil,
                 externalURL: URL? = nil,
                 title: String? = nil,
                 contentHTML: String? = nil,
                 contentText: String? = nil,
                 summary: String? = nil,
                 image: URL? = nil,
                 bannerImage: URL? = nil,
                 datePublished: Date? = nil,
                 dateModified: Date? = nil,
                 author: Author? = nil,
                 tags: [String]? = nil,
                 attachments: [Attachment]? = nil)
    {
        if contentHTML == nil && contentText == nil {
            return nil
        }
        
        self.id = id
        self.url = url
        self.externalURL = externalURL
        self.title = title
        self.contentHTML = contentHTML
        self.contentText = contentText
        self.summary = summary
        self.image = image
        self.bannerImage = bannerImage
        self.datePublished = datePublished
        self.dateModified = dateModified
        self.author = author
        self.tags = tags
        self.attachments = attachments
    }
    
    // MARK: Codable
    
    private enum CodingKeys: String, CodingKey {
        case id
        case url
        case externalURL = "external_url"
        case title
        case contentHTML = "content_html"
        case contentText = "content_text"
        case summary
        case image
        case bannerImage = "banner_image"
        case datePublished = "date_published"
        case dateModified = "date_modified"
        case author
        case tags
        case attachments
    }
}
