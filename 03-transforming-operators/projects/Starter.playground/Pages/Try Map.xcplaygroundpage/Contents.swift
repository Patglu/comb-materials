
import Combine
import SwiftUI

/*
 operators have a try counterpart where it takes in a throwing closure, 
 if you throw an error the operator will emit that error downstream.
 */
example(of: "tryMap"){
    Just("Directory name that doesn't exsist")
        .tryMap{
            try 
                FileManager.default.contentsOfDirectory(atPath: $0)
        }
        .sink(receiveCompletion: {print($0)}, receiveValue: {print($0)})
        .store(in: &subscriptions)
}

