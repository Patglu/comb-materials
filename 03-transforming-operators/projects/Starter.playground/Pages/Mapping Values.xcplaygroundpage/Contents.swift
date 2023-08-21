
import Combine
import SwiftUI

example(of: "map"){
    /*
     Turning numbers into thier string equivalent 
     */
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    [123,4,56].publisher
        .map{
            formatter.string(for: NSNumber(integerLiteral: $0)) ?? ""
        }
        .sink(receiveValue: {print($0)})
        .store(in: &subscriptions)
}

example(of: "Mapping key paths"){
    //1
    let publisher = PassthroughSubject<Coordinate, Never>()
    
    //2
    publisher //3
        .map(\.x, \.y)
        .sink(receiveValue: {x, y in
            print( //4 
                "The coordinate at (\(x), \(y)) is in quadrant", quadrantOf(x: x, y: y)
            )
        })
        .store(in: &subscriptions)
    
    //5
    publisher.send(Coordinate(x: 10, y: -8))
    publisher.send(Coordinate(x: 0, y: 5))
    /*
     1. create a publisher that will never emit an error
     2. Begin a subscription to the publihser 
     3. Map into the x and y properties of Coordinate 
     4. print the quadrant 
     6. send coordinates to though the publihser 
     */
}
