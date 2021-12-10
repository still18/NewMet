//
//  Brush.swift
//  NewMet
//
//  Created by Sean on 12/5/21.
//

import Foundation

struct BrushSong {
    
    var combs: [Comb]
    var name: String
    var id: Int
    
    /* "Methods" */
    
    init(_ cmb: [Comb], _ nm: String, _ id: Int) {
        self.combs = cmb
        self.name = nm
        self.id = id
    }
    
    init(_ SEM: [String],_ SES: [String], _ SET: [String]) {
        var combList = [Comb].init()
        for (ind) in 0 ..< SEM.count {
            print("INPUT:", Int(SES[ind])!, 4, Int(SET[ind])!, Int(SEM[ind])!)
            let tempComb = Comb(Int(SES[ind])!, 4, Int(SET[ind])!, Int(SEM[ind])!)
            combList.append(tempComb)
        }
        self.combs = combList
        self.name = "New Preset 1"
        self.id = -1
    }
    
    
    func getCombs() -> [Comb] {
        return self.combs
    }
    
    func getTotalMeasures() -> Int {
        var count = 0
        for c in combs {
            count = count + c.getMeasures()
        }
        return count
    }
    
    func substring(string: String, fromIndex: Int, toIndex: Int) -> String? {
        if fromIndex < toIndex && toIndex < string.count /*use string.characters.count for swift3*/{
            let startIndex = string.index(string.startIndex, offsetBy: fromIndex)
            let endIndex = string.index(string.startIndex, offsetBy: toIndex)
            return String(string[startIndex..<endIndex])
        }else{
            return nil
        }
    }
    
    func getShortenedName() -> String {
        if (self.name.count <= 30) {
            return self.name
        } else {
            return substring(string: self.name, fromIndex: 0, toIndex: 27)! + "..."
        }
    }
    
//    func createCombs(strings: [String]) -> [Comb] {
//        return [Comb].init()
//    }
    
    
}


