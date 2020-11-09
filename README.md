# JSONFeed

[![Build Status][build status badge]][build status]

A Swift encoder and decoder for the [JSON Feed](https://jsonfeed.org) format.

## Usage

```swift
// For an example, see https://jsonfeed.org/feed.json
let json = "{ ... }"

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601

let feed = try! decoder.decode(Feed.self, from: data)

print(feed.title)

for item in feed.items {
    print("* \(item.title!) - \(item.datePublished!)")
}
```

## License

MIT

## Contact

Mattt ([@mattt](https://twitter.com/mattt))

[build status]: https://github.com/Flight-School/JSONFeed/actions?query=workflow%3ACI
[build status badge]: https://github.com/Flight-School/JSONFeed/workflows/CI/badge.svg
