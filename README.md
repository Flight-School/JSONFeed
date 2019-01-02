# JSONFeed

![Build Status](https://api.travis-ci.com/Flight-School/JSONFeed.svg?branch=master)

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
