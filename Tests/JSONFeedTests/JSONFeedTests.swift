import XCTest
@testable import JSONFeed

final class JSONFeedTests: XCTestCase {
    var decoder: JSONDecoder!
    
    override func setUp() {
        self.decoder = JSONDecoder()
        self.decoder.dateDecodingStrategy = .iso8601
    }
    
    func testJSONFeedDecoding() {
        let bundle = Bundle(for: JSONFeedTests.self)
        let url = bundle.url(forResource: "feed", withExtension: "json")!
        let json = try! Data(contentsOf: url)
        
        let feed = try! self.decoder.decode(Feed.self, from: json)
        
        XCTAssertEqual(feed.version.absoluteString, "https://jsonfeed.org/version/1")
        XCTAssertEqual(feed.title, "JSON Feed")
        XCTAssertEqual(feed.description, "JSON Feed is a pragmatic syndication format for blogs, microblogs, and other time-based content.")
        XCTAssertEqual(feed.homePageURL?.absoluteString, "https://jsonfeed.org/")
        XCTAssertEqual(feed.feedURL?.absoluteString, "https://jsonfeed.org/feed.json")
        
        XCTAssertEqual(feed.author?.name, "Brent Simmons and Manton Reece")
        XCTAssertEqual(feed.author?.url?.absoluteString, "https://jsonfeed.org/")
        
        XCTAssertEqual(feed.items.count, 1)
        XCTAssertEqual(feed.items.first?.title, "Announcing JSON Feed")
        XCTAssertEqual(feed.items.first?.datePublished, Date(timeIntervalSince1970: 1495033332))
        XCTAssertEqual(feed.items.first?.id, "https://jsonfeed.org/2017/05/17/announcing_json_feed")
        XCTAssertEqual(feed.items.first?.url?.absoluteString, "https://jsonfeed.org/2017/05/17/announcing_json_feed")
        XCTAssert((feed.items.first?.contentHTML?.starts(with: "<p>We — Manton Reece and Brent Simmons"))!)
    }

    static var allTests = [
        ("testJSONFeedDecoding", testJSONFeedDecoding),
    ]
}
