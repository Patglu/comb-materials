import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "collect") {
  ["A", "B", "C", "D", "E"].publisher
    .collect()
    .sink(receiveCompletion: { print($0) },
          receiveValue: { print($0) })
    .store(in: &subscriptions)
}

/*
 You can use the `.collect(2)` to collect items in batches 
 */



