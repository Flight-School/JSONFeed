import Foundation

public struct Attachment: Codable, Equatable {
    /**
     The location of the attachment.
     */
    public var url: URL
    
    /**
     The type of the attachment, such as "audio/mpeg."
     */
    public var mimeType: String
    
    /**
     A name for the attachment.
     
     - Important: If there are multiple attachments,
                  and two or more have the exact same title
                  (when title is present), then they are considered as
                  alternate representations of the same thing.
                  In this way a podcaster, for instance,
                  might provide an audio recording in different formats.
     */
    public var title: String?
    
    /**
     The size of the file, in bytes.
     */
    public var size: Int?
    
    /**
     The duration of the audio or video, when played at normal speed.
     */
    public var duration: TimeInterval?
    
    // MARK: -
    
    public init(url: URL,
                mimeType: String,
                title: String? = nil,
                size: Int? = nil,
                duration: TimeInterval? = nil)
    {
        self.url = url
        self.mimeType = mimeType
        self.title = title
        self.size = size
        self.duration = duration
    }
    
    // MARK: Codable
    
    private enum CodingKeys: String, CodingKey {
        case url
        case mimeType = "mime_type"
        case title
        case size = "size_in_bytes"
        case duration = "duration_in_seconds"
    }
}
