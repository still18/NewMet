//
//  ContentView.swift
//  NewMet
//
//  Created by Sean on 10/7/21.
//

//Metronome/main page
import SwiftUI
import Combine

struct ContentView: View {
    
    @State var playing: Bool = false
    @State var but1Status: Bool = false
    @State var but2Status: Bool = false
    
    @State var displayCount : String = "1"
    
    @ObservedObject var metro2: Metronome = Metronome()
    //var Metro2 = BPMTimer(bpm: 110)
    
    
    var c: Color = .black;
    
    var body: some View {
        VStack() {
            //title
            Text("New Metronome").font(.largeTitle)
                .padding()
            VStack() {
                Spacer().frame(height: 45)
                Slider(value: $metro2.sliderPercent).frame(width: 300)
                Spacer().frame(height: 15)
                Text("BPM = \(metro2.beatsPerMinute)")
                Spacer().frame(height: 35)
            }
            
//            NavigationView {
//                    VStack {
//                        Text("Hello World")
//                        NavigationLink(destination: CreationView()) {
//                            Text("Hit Me!")
//                                .fontWeight(.semibold)
//                                .font(.title)
//                                .padding()
//                                .foregroundColor(.white)
//                                .background(LinearGradient(gradient: Gradient(colors: [Color(.white),Color(.blue)]), startPoint: .leading, endPoint: .trailing))
//                                .cornerRadius(40)
//                    }
//                }
//            }
            
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
                    Text("Sound selection")
                    //drop down menu?
                    //Rectangle().fill(Color.init(.blue)).frame(width: 95, height: 30)
                    DropDown(initialText: "Choose sound")
                }
                

            }
            
            //accent control
            VStack() {
                Spacer().frame(height: 40)
                Text("Accents")
                //buttons
                HStack() {
                    Button(action: {
                        //metro.stopTimer()
                    }) {
                        Text("1")
                    }.buttonStyle(NeumorphicButtonStyle(bgColor: .purple))
                    Button(action: {
                        //metro.restartTimer()
                    }) {
                        Text("2")
                    }.buttonStyle(NeumorphicButtonStyle(bgColor: .purple))
                    Button(action: {
                        //methods here
                    }) {
                        Text("3")
                    }.buttonStyle(NeumorphicButtonStyle(bgColor: .purple))
                }
            }
            
            Spacer().frame(height: 50)
            
            HStack() {
                Spacer().frame(width: 10)
                //song progression
                //Text(displayCount).foregroundColor(.white).font(.largeTitle).background(Rectangle().fill(c).frame(width: 150, height: 250))
                RoundedRectangle(cornerRadius: 5).fill(Color.black).overlay(VStack() {
                    Text("\(String(metro2.quarterBeat.current + 1))").foregroundColor(.white).font(.subheadline)
                    Text("\(String(metro2.eigthBeat.current + 1))").foregroundColor(.white).font(.largeTitle)
                    Text("\(String(metro2.sixteenthBeat.current + 1))").foregroundColor(.white).font(.subheadline)
                }).frame(width: 130, height: 190)
                Spacer().frame(width: 70)
                //countoff/play
                VStack() {
                    //Countoff details MOVE TO SMARTMET
                    //Text("Countoff")
                    //DropDown(initialText: "Number of counts")
                    Spacer().frame(height: 5)
                    //Image(systemName: "play.fill").resizable().frame(width: 60, height: 60)
                    Button(action: {
                        if (playing) {
                            print("Stopping playback")
                            //self.displayCount = "3"
                            metro2.stopTimer()
                            //Metro2.stop()
                        } else {
                            print("Starting playback!")
                            //self.displayCount = "2"
                            metro2.restartTimer()
                            //Metro2.start()
                        }
                        playing = !playing
                        //print("Swapped states")
                    }) {
                        Image(systemName: playing ? "pause.rectangle" : "play.rectangle").resizable().frame(width: 90, height: 80)
                    }
                }
            }
        }.onAppear()
    }
}

func setup() {
    print("Setup complete lol")
}

//Button styling
struct NeumorphicButtonStyle: ButtonStyle {
    var bgColor: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
        )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
            .animation(.spring())
    }
}

struct DropDown: View {
    var initialText: String
    @State var expanded = false
    var body: some View {
        VStack() {
            VStack(spacing: 30) {
                HStack() {
                    Text(initialText).fontWeight(.bold).foregroundColor(.black)
                    Image(systemName: expanded ? "chevron.up": "chevron.down").resizable().frame(width: 13, height: 6).foregroundColor(.black)
                }.onTapGesture {
                    self.expanded.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
