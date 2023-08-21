import Combine
import SwiftUI

/*
 1. Create a computed proterty that generates a random integar between -10 and 10
 2. Use the generator to create a publisher from an array of random ints
 3. Use scan with a starting string value of 50 then add each daily change 
 the `max keeps the price non negative`
 */

example(of: "Scan"){
    //1
    var dailyGainLoss: Int {.random(in: -10...10)}
    
    //2
    let august2019 = (0..<22)
        .map{ _ in dailyGainLoss} 
        .publisher
    
    //3
    august2019
        .scan(50) {latest, current in 
            max(0, latest + current)
        }
        .sink(receiveValue: {_ in})
        .store(in: &subscriptions)
}
