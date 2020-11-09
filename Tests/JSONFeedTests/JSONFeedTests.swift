import XCTest
@testable import JSONFeed

@available(OSX 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
final class JSONFeedTests: XCTestCase {
    var decoder: JSONDecoder!

    override func setUp() {
        self.decoder = JSONDecoder()
        self.decoder.dateDecodingStrategy = .iso8601
    }

    func testJSONFeedDecoding() {
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
}

fileprivate let json = #"""
{
    "version": "https://jsonfeed.org/version/1",
    "user_comment": "This feed allows you to read the posts from this site in any feed reader that supports the JSON Feed format. To add this feed to your reader, copy the following URL — https://jsonfeed.org/feed.json — and add it your reader.",
    "title": "JSON Feed",
    "description": "JSON Feed is a pragmatic syndication format for blogs, microblogs, and other time-based content.",
    "home_page_url": "https://jsonfeed.org/",
    "feed_url": "https://jsonfeed.org/feed.json",
    "author": {
        "name": "Brent Simmons and Manton Reece",
        "url": "https://jsonfeed.org/"
    },
    "items": [
        {
            "title": "Announcing JSON Feed",
            "date_published": "2017-05-17T08:02:12-07:00",
            "id": "https://jsonfeed.org/2017/05/17/announcing_json_feed",
            "url": "https://jsonfeed.org/2017/05/17/announcing_json_feed",
            "content_html": "<p>We — Manton Reece and Brent Simmons — have noticed that JSON has become the developers’ choice for APIs, and that developers will often go out of their way to avoid XML. JSON is simpler to read and write, and it’s less prone to bugs.</p>\n\n<p>So we developed JSON Feed, a format similar to <a href=\"http://cyber.harvard.edu/rss/rss.html\">RSS</a> and <a href=\"https://tools.ietf.org/html/rfc4287\">Atom</a> but in JSON. It reflects the lessons learned from our years of work reading and publishing feeds.</p>\n\n<p><a href=\"https://jsonfeed.org/version/1\">See the spec</a>. It’s at version 1, which may be the only version ever needed. If future versions are needed, version 1 feeds will still be valid feeds.</p>\n\n<h4>Notes</h4>\n\n<p>We have a <a href=\"https://github.com/manton/jsonfeed-wp\">WordPress plugin</a> and, coming soon, a JSON Feed Parser for Swift. As more code is written, by us and others, we’ll update the <a href=\"https://jsonfeed.org/code\">code</a> page.</p>\n\n<p>See <a href=\"https://jsonfeed.org/mappingrssandatom\">Mapping RSS and Atom to JSON Feed</a> for more on the similarities between the formats.</p>\n\n<p>This website — the Markdown files and supporting resources — <a href=\"https://github.com/brentsimmons/JSONFeed\">is up on GitHub</a>, and you’re welcome to comment there.</p>\n\n<p>This website is also a blog, and you can subscribe to the <a href=\"https://jsonfeed.org/xml/rss.xml\">RSS feed</a> or the <a href=\"https://jsonfeed.org/feed.json\">JSON feed</a> (if your reader supports it).</p>\n\n<p>We worked with a number of people on this over the course of several months. We list them, and thank them, at the bottom of the <a href=\"https://jsonfeed.org/version/1\">spec</a>. But — most importantly — <a href=\"http://furbo.org/\">Craig Hockenberry</a> spent a little time making it look pretty. :)</p>\n"
        }
    ]
}
"""#.data(using: .utf8)!
