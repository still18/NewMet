//
//  Transfer.swift
//  NewMet
//
//  Created by Sean on 12/6/21.
//

import Foundation

class TransferData {
    
    var loaded: Bool = false
    
    var loadStringsTemp: [String]

    init() {
        self.loadStringsTemp = [String].init()
    }
    
    func songIsLoaded() {
        loaded = true
    }
    
    func getLoaded() -> Bool {
        return loaded
    }
    
    
    func getLST() -> [String] {
        return self.loadStringsTemp
    }
    
    func setLST(input: [String]) {
        self.loadStringsTemp = input
    }
    
    func printLST() {
        print(loadStringsTemp)
    }
    
    func getMeasuresFromLST() -> [String] {
        let stringArray = loadStringsTemp[0].components(separatedBy: CharacterSet.decimalDigits.inverted)
//        for item in stringArray {
//            if let number = Int(item) {
//                print("number: \(number)")
//            }
//        }
        //print(stringArray)
        return stringArray
    }
    
    func getSignaturesFromLST() -> [String] {
        let stringArray = loadStringsTemp[1].components(separatedBy: CharacterSet.decimalDigits.inverted)
        return stringArray
    }
    
    func getTempoFromLST() -> [String] {
        let stringArray = loadStringsTemp[2].components(separatedBy: CharacterSet.decimalDigits.inverted)
        return stringArray
    }
    
    
}
