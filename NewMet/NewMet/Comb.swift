//
//  Comb.swift
//  OOP stuct for presets
//  NewMet
//
//  Created by Sean on 12/2/21.
//

import Foundation

struct Comb {
    /* "Fields" */
    
    //time signature
    var numerator: Int
    var denominator: Int
    
    //tempo
    var bpm: Int
    
    //Length in *measures!*
    var measures: Int
    
    
    /* "Methods" */
    init(_ nm: Int, _ dm: Int, _ bpm: Int, _ meas: Int) {
        self.numerator = nm
        self.denominator = dm
        self.bpm = bpm
        self.measures = meas
    }
    
    func getNumerator() -> Int {
        return self.numerator
    }
    
    func getDenominatory() -> Int {
        return self.denominator
    }
    
    func getBpm() -> Int {
        return self.bpm
    }
    
    func getMeasures() -> Int {
        return self.measures
    }
    
    
}
