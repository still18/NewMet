//
//  SongView.swift
//  NewMet
//
//  Created by Sean on 10/13/21.
//

import SwiftUI

let TD = TransferData()

struct SongView: View {
    
    @State var playing: Bool = false
    @State var but1Status: Bool = false
    @State var but2Status: Bool = false
    
    @State private var countoffBoo = false
    @State private var showingAlert = false
    
    @State var playText: String = "-----"
    
    @State var al1: Bool = false
    @State var al2: Bool = false
    @State var al3: Bool = false
    @State var al4: Bool = false
    @State var al5: Bool = false
    @State var al6: Bool = false
    
    @ObservedObject var metro: PresetMetronome = PresetMetronome()
    
    func updateAlBools(alIns: [Bool]) {
        metro.setAccents(newAccs: alIns)
    }
    
    var body: some View {
        NavigationView {//OFFSET
        VStack() {
            //title
            Text("Preset Metronome").font(.largeTitle)
                .padding()
//            VStack() {
//                Spacer().frame(height: 45)
//                Slider(value: $metro.sliderPercent).frame(width: 300)
//                Spacer().frame(height: 15)
//                Text("BPM = \(metro.beatsPerMinute)")
//                Spacer().frame(height: 35)
//            }
            
            Spacer().frame(height: 55)
            
            HStack() {
                //speed/division modifiers
                Button(action: {
                    if (but1Status) {
                        but1Status = !but1Status
                        print("Button 1 off")
                        //update?
                    } else {
                        if (but2Status) {
                            but1Status = !but1Status
                            but2Status = !but2Status
                            print("Buttons flipped")
                        } else {
                            but1Status = !but1Status
                            print("Button 1 on")
                        }
                        //update?
                    }
                }) {
                    Text("X 1/2")
                }.buttonStyle(NeumorphicButtonStyle(bgColor: but1Status ? .green : .gray)).frame(width: 80, height: 35)
                Spacer().frame(width: 10)
                
                Button(action: {
                    if (but2Status) {
                        but2Status = !but2Status
                        print("Button 2 off")
                        //update?
                    } else {
                        if (but1Status) {
                            but2Status = !but2Status
                            but1Status = !but1Status
                            print("Buttons flipped")
                        } else {
                            but2Status = !but2Status
                            print("Button 2 on")
                        }
                        //update?
                    }
                }) {
                    Text("X 2")
                }.buttonStyle(NeumorphicButtonStyle(bgColor: but2Status ? .green : .gray)).frame(width: 80, height: 35)
                Spacer().frame(width: 30)
                
                //sound control
                VStack() {
                    Text("Load a Preset:")
                    Spacer().frame(height: 10)
//                    Button(action: {
//
//                    }) {
//                        Text("Create new Preset")
//                    }
                    NavigationLink(destination: CreationView()) {
//                        Button(action: {
//                            //print("Real bruh")
//                        }) {
//                            Text("Create new Preset")
//                        }
                        Text("Create new Preset")
                    }
                }
                
//                NavigationView {
//                        VStack {
//                            NavigationLink(destination: CreationView()) {
//                                Text("Hit Me!")
//                                    .fontWeight(.semibold)
//                                    .font(.title)
//                                    .padding()
//                                    .foregroundColor(.white)
//                                    .background(LinearGradient(gradient: Gradient(colors: [Color(.white),Color(.blue)]), startPoint: .leading, endPoint: .trailing))
//                                    .cornerRadius(20)
//                        }
//                    }
//                }
                

            }
            
            //accent control
            VStack() {
                Spacer().frame(height: 40)
                Text("Accents")
                //buttons
                HStack() {
                    Button(action: {
                        al1 = !al1
                        self.updateAlBools(alIns: [al1, al2, al3, al4, al5, al6])
                    }) {
                        Text("1")
                    }.buttonStyle(NeumorphicButtonStyle(bgColor: al1 ? .green : .gray))
                    Button(action: {
                        al2 = !al2
                        self.updateAlBools(alIns: [al1, al2, al3, al4, al5, al6])
                    }) {
                        Text("2")
                    }.buttonStyle(NeumorphicButtonStyle(bgColor: al2 ? .green : .gray))
                    Button(action: {
                        al3 = !al3
                        self.updateAlBools(alIns: [al1, al2, al3, al4, al5, al6])
                    }) {
                        Text("3")
                    }.buttonStyle(NeumorphicButtonStyle(bgColor: al3 ? .green : .gray))
                    Button(action: {
                        al4 = !al4
                        self.updateAlBools(alIns: [al1, al2, al3, al4, al5, al6])
                    }) {
                        Text("4")
                    }.buttonStyle(NeumorphicButtonStyle(bgColor: al4 ? .green : .gray))
                    Button(action: {
                        al5 = !al5
                        self.updateAlBools(alIns: [al1, al2, al3, al4, al5, al6])
                    }) {
                        Text("5")
                    }.buttonStyle(NeumorphicButtonStyle(bgColor: al5 ? .green : .gray))
                    Button(action: {
                        al6 = !al6
                        self.updateAlBools(alIns: [al1, al2, al3, al4, al5, al6])
                    }) {
                        Text("6")
                    }.buttonStyle(NeumorphicButtonStyle(bgColor: al6 ? .green : .gray))
//                    Button(action: {
//                        //metro.stopTimer()
//                    }) {
//                        Text("7")
//                    }.buttonStyle(NeumorphicButtonStyle(bgColor: .purple)).frame(width: 20, height: 30)
//                    Button(action: {
//                        //metro.stopTimer()
//                    }) {
//                        Text("8")
//                    }.buttonStyle(NeumorphicButtonStyle(bgColor: .purple)).frame(width: 20, height: 30)
//                    Button(action: {
//                        //metro.stopTimer()
//                    }) {
//                        Text("9")
//                    }.buttonStyle(NeumorphicButtonStyle(bgColor: .purple)).frame(width: 20, height: 30)
                }
            }
            
            Spacer().frame(height: 50)
            
            RoundedRectangle(cornerRadius: 5).fill(Color.black).overlay(VStack() {
                //Text("\(String(metro.quarterBeat.current + 1))").foregroundColor(.white).font(.subheadline)
                //Text("\(String(metro.eigthBeat.current + 1))").foregroundColor(.white).font(.largeTitle)
                //Text("\(String(metro.sixteenthBeat.current + 1))").foregroundColor(.white).font(.subheadline)
                Text("Selected piece: \(String(playText))").foregroundColor(.white).font(.subheadline)
                Spacer().frame(height: 30)
                Text("Measure: \(String(metro.posStats.measure))").foregroundColor(.white).font(.subheadline)
                Text("Beat: \(String(metro.posStats.beat))").foregroundColor(.white).font(.largeTitle)
            }).frame(width: 350, height: 180)
            
            VStack() {
                //Countoff details MOVE TO SMARTMET
                //Text("Countoff")
                //DropDown(initialText: "Number of counts")
                Spacer().frame(height: 25)
                //Image(systemName: "play.fill").resizable().frame(width: 60, height: 60)
                HStack() {
                    VStack() {
                        //Text("Countoff?")
                        Toggle(isOn: $countoffBoo) {
                            Text("Countoff?")
                        }.padding(65)
                    }
                    
                    Button(action: {
                        if (metro.pyng) {
                            print("Stopping playback (", !metro.pyng, ")")
                            metro.toggleNps()
                            metro.emergInval()
                            playing = false
                        } else {
                            TD.printLST()//REMOVE
                            if (!TD.getLoaded()) {
                                print("Need to load a song first")
                                showingAlert = true
                                return
                            }
                            print("Starting playback! (", !metro.pyng, ")")
                            let inputBrush = BrushSong(TD.getMeasuresFromLST(), TD.getSignaturesFromLST(), TD.getTempoFromLST())
                            playText = inputBrush.getShortenedName()
                            metro.specWrap(brushInput: inputBrush, isThereCountOff: false)//CHANGE FALSE
                            playing = true
                            var endTimer: Timer?
                            endTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                                if (!metro.pyng) {
                                    print("Swapping")
                                    playing = false;
                                    endTimer?.invalidate()
                                }
                            }
                        }
                    }) {
                        Image(systemName: self.playing ? "pause.rectangle" : "play.rectangle").resizable().frame(width: 90, height: 80)
                    }
                    
                    Spacer().frame(width: 50)
                }
            }
        }.onAppear()

    }.alert(isPresented: $showingAlert) {
        Alert(title: Text("Attention!"), message: Text("Please set a preset before playing"), dismissButton: .default(Text("OK!"))) }
}//OFFSET
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView()
    }
}

