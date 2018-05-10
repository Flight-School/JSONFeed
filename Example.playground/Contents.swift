import Foundation
import JSONFeed
import PlaygroundSupport

let url = URL(string: "https://flight.school/feed.json")!
URLSession.shared.dataTask(with: url) { (data, _, error) in
    guard let data = data, error == nil else {
        fatalError("\(error?.localizedDescription ?? "request failed")")
    }
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    
    let feed = try! decoder.decode(Feed.self, from: data)
    print(feed.title)
    
    for item in feed.items {
        print("* \(item.title!) - \(item.datePublished!)")
    }
}.resume()

PlaygroundPage.current.needsIndefiniteExecution = true


