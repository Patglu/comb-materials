import Combine
import SwiftUI

/*
 1. create a publisher from an array of optional strings
 
 1.2 replaceNil(with:) has overloads which can confuse Swift into picking the wrong one for your use case. This results in the type remaining as Optional<String> instead of being fully unwrapped. The code above uses eraseToAnyPublisher() to work around that bug
 
 2. Use replaceNil(with:) to replace nil values from upstream the publisher
 3. Print out the value
 */

example(of: "replaceNil"){
    ["A",nil,"C"] //1
        .publisher
        .eraseToAnyPublisher() //1.2
        .replaceNil(with: "-") //2
        .sink(receiveValue: {print($0)}) //3
        .store(in: &subscriptions)
}

/*
 Create an empty publisher that immediatley emits a completion event
 and subscribe to it 
 */

example(of: "replaceEmpty"){
    //1 
    let empty = Empty<Int, Never>()
    
    empty
        .sink(receiveCompletion: {print($0)}, receiveValue: {print($0)})
        .store(in: &subscriptions)
}
