
import Combine
import SwiftUI

/*
 1. Define a function that takes an array of integers, each representing an ASCII code, and returns a type erased publisher of strings
 2. Create a Just publisher that converts the character code into a string if its within the range of 0.255.
 3. Join tge numbers.
 4. Type erase the publihser to match the return type of the function
 5. Create a secret array of ASCII character codes, convert it to a publisher 
 6. Use flatmap to pass the array element to your decoder functions
 7. Subscribe the element emitted by the publisher returned 
 */

example(of: "flatMap") {
    // 1
    func decode(_ codes: [Int]) -> AnyPublisher<String, Never> {
        // 2
        Just( codes
                .compactMap { code in
                    guard (32...255).contains(code) else { return nil }
                    return String(UnicodeScalar(code) ?? " ")
                }
                // 3
                .joined() )
            // 4
            .eraseToAnyPublisher()
    }
    
    //5
    [72, 101, 108,108, 111, 44, 32, 87, 111, 114, 108, 100, 33]
        .publisher
        .collect()//6
        .flatMap(decode) //7
        .sink(receiveValue: {print ($0)})
        .store(in: &subscriptions)
}


