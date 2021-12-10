//
// Metrome model details below
// All some functions are mine (Sean Tillman) and some functions have been modified
//
//  Model.swift
//  MetroGnome
//
//  Created by Nicholas Maccharoli on 2019/08/04.
//  Copyright © 2019 Nicholas Maccharoli. All rights reserved.
//

import SwiftUI
import Combine
import AVFoundation

class PresetMetronome: NSObject, ObservableObject {
    
    var timer: Timer?
    var timer2: Timer?
    var timer3: Timer?
    let objectWillChange = PassthroughSubject<Void, Never>()
    private let granularity: Int = 16
        
    private var timeInterval: TimeInterval {
        //return 1 / ((Double(beatsPerMinute) / 60.0) * Double(granularity))
        return (60.0 / (Double(trueBPM)))//was bpm regular instead of true
    }
    
    func calcTimeAgain(bpm: Int) -> Double {
        return (60.0 / (Double(bpm)))
    }
    
    var clickPlayer: AVAudioPlayer?
    
    
//    func configureTimer() {
//        timer?.invalidate()
//        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
//            self.tick()
//        }
//    }
    
    func stopTimer() {
        timer?.invalidate()
        print("Slider at ", sliderPercent, " when ended")
        print("BPM at ", beatsPerMinute, " when ended")
        current = 0
    }
    
    func restartTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
            self.tick()
        }
    }
    
    private var current: Int = 0
    
    var quarterBeat: (current: Int, total: Int) {
        (current / 4, 4)
    }
    
    var eigthBeat: (current: Int, total: Int) {
         (current / 2, 8)
    }
    
    var sixteenthBeat: (current: Int, total: Int) {
         (current, 8)
        
    }
        
    private var curBeat: Int = 0
    private var curMeasure: Int = 0
    
    var posStats: (beat: Int, measure: Int) {
        (curBeat, curMeasure)
    }
    
    @Published var pyng: Bool = false
    
    var accents: [Bool] = [false, false, false, false, false, false]
    
    func setAccents(newAccs: [Bool]) {
        self.accents = newAccs
    }
    
//    var newPlayingStatus: (rn: Bool, bruh: Int) {
//        (pyng, 1)
//    }
    
    func toggleNps() {
        self.pyng = !self.pyng
    }
    
//    func special() {
//        print("Starting special")
//        // let bpmList: [Int] = [80, 100, 120, 170]
//        // let countList: [Int] = [16, 8, 32, 12]
//        let combList: [Comb] = [Comb(3, 4, 120, 4), Comb(4, 4, 180, 8)]
//        var count: Int = 0
//        var countInd: Int = -1
//
//        let dispatchGroup = DispatchGroup()
//        let dispatchQueue = DispatchQueue(label: "any-label-name")
//        let dispatchSemaphore = DispatchSemaphore(value: 0)
//
//        print("Reached for loop. Starting now...")
//        dispatchQueue.async {
//            for (ind) in 0 ..< combList.count {
//                //dispatchGroup.enter()
//                countInd = countInd + 1
//                print("Iteration", countInd)
//                print("Incremented")
//
//
//                self.timer3 = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { timer in
//                    dispatchSemaphore.signal()
//                    self.timer2?.invalidate()
//                    self.timer2 = Timer.scheduledTimer(withTimeInterval: self.calcTimeAgain(bpm: combList[ind].getBpm()), repeats: true) { timer in
//                        print("Click", combList[ind].getBpm(), ", count", count)
//                        count = count + 1
//                        if (count == (combList[ind].getMeasures() * combList[ind].getNumerator())) {
//                            print("BREAKING")
//                            self.timer3?.invalidate()
//                            self.timer2?.invalidate()
//                            count = 0
//                            dispatchSemaphore.signal()
//                            //dispatchGroup.leave()
//                        }
//                    }
//                }
//                dispatchSemaphore.wait()
//            }
//        }
//        dispatchGroup.notify(queue: dispatchQueue) {
//            DispatchQueue.main.async {
//                print("Finished?")
//            }
//
//        }
//    }
    
    func specWrap(brushInput: BrushSong, isThereCountOff: Bool) {
        // let bpmList: [Int] = [70, 100, 150, 190]
        // let countList: [Int] = [8, 16, 32, 20]
        //print("Is there countoff?", isThereCountOff)
        toggleNps()
        print(pyng)
        //let combList: [Comb] = [Comb(3, 4, 120, 4), Comb(4, 4, 180, 8)]
        let combList: [Comb] = brushInput.getCombs()
        self.spec2(inputCount: 0, combs: combList)
    }
    
    func spec2(inputCount: Int, combs: [Comb]) {
        
        if (inputCount >= combs.count) {
            print("STOPPING")
            toggleNps()
            print(pyng)
            return
        }
        print("At interation", inputCount)
        //timer2?.invalidate()
        var count: Int = 0
        self.curBeat = 1
        self.curMeasure = 1
        if (self.accents[self.curBeat - 1]) {
            self.playAccentedSound()
        } else {
            self.playSound()
        }
        print("In timer!", 1, " ---- Measure", self.curMeasure, " - Beat", self.curBeat)
        self.timer2 = Timer.scheduledTimer(withTimeInterval: self.calcTimeAgain(bpm: combs[inputCount].getBpm()), repeats: true) { timer in
            if (count == (combs[inputCount].getMeasures() * combs[inputCount].getNumerator()) - 1) {
                print("TRYING TO SWITCH TIMERS")
                self.timer2?.invalidate()
                let newInputCount: Int = inputCount + 1
                self.spec2(inputCount: newInputCount, combs: combs)
                return//remove?
            }
            self.curBeat += 1
            if (self.curBeat == combs[inputCount].getNumerator() + 1) {
                self.curBeat = 1
                self.curMeasure += 1
            }
            count += 1
            print("In timer!", count + 1, "  ----   Measure", self.curMeasure, "- Beat", self.curBeat)
            if (self.accents[self.curBeat - 1]) {
                self.playAccentedSound()
            } else {
                self.playSound()
            }
            self.objectWillChange.send()//NEW
            
        }
        //print("End of timer")
    }
    
    func emergInval() {
        timer?.invalidate()
        timer2?.invalidate()
        timer3?.invalidate()
    }

    
    // Default is 16th notes
    func tick() {
        
        playSound()
        
        current += 1
        print("tick ", current)
        
        
        if current >= granularity {
            current = 0
        }
        objectWillChange.send()
    }
    
    func playSound() {
        //play sound
        guard let url = Bundle.main.url(forResource: "click1", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
    
            clickPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
    
            guard let clickPlayer = clickPlayer else { return }
            clickPlayer.play()
        } catch let err {
            print("Problem: ", err.localizedDescription)
        }
        //end sound
    }
    
    func playAccentedSound() {
        //play sound
        guard let url = Bundle.main.url(forResource: "click2", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
    
            clickPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
    
            guard let clickPlayer = clickPlayer else { return }
            clickPlayer.play()
        } catch let err {
            print("Problem: ", err.localizedDescription)
        }
        //end sound
    }
    
    var beatsPerMinute: Int {
        Int(sliderPercent * 208)
    }
    
    var trueBPM: Int {
        Int(beatsPerMinute * 2)
    }
    
    var sliderPercent: Double = 0.5 {
        didSet {
            //configureTimer()
            objectWillChange.send()
        }
    }

}

//        let soundFileClick = Bundle.main.path(forResource: "click1", ofType: "mp3")!
//        let soundURL = URL(fileURLWithPath: soundFileClick)
//        do {
//            clickPlayer = try AVAudioPlayer(contentsOf: soundURL)
//            clickPlayer?.play()
//        } catch {
//            print("Mercy file not found")
//        }



