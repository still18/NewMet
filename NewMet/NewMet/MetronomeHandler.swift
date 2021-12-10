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

class Metronome: ObservableObject {
    
    var timer: Timer?
    let objectWillChange = PassthroughSubject<Void, Never>()
    private let granularity: Int = 16
        
    private var timeInterval: TimeInterval {
        //return 1 / ((Double(beatsPerMinute) / 60.0) * Double(granularity))
        return (60.0 / (Double(trueBPM)))//was bpm regular instead of true
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


