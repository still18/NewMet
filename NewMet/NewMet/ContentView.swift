//
//  ContentView.swift
//  NewMet
//
//  Created by Sean on 10/7/21.
//

//Metronome/main page
import SwiftUI

struct ContentView: View {
    
    @State var playing: Bool = false
    @State var but1Status: Bool = false
    @State var but2Status: Bool = false
    
    var c: Color = .black;
    
    var body: some View {
        VStack() {
            //title
            Text("New Metronome")
                .padding()
            Spacer().frame(height: 45)
            
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
                    Button(action: {}) {
                        Text("1")
                    }.buttonStyle(NeumorphicButtonStyle(bgColor: .purple))
                    Button(action: {}) {
                        Text("2")
                    }.buttonStyle(NeumorphicButtonStyle(bgColor: .purple))
                    Button(action: {}) {
                        Text("3")
                    }.buttonStyle(NeumorphicButtonStyle(bgColor: .purple))
                }
            }
            
            Spacer().frame(height: 50)
            
            HStack() {
                //song progression
                Rectangle().fill(c).frame(width: 150, height: 250)
                Spacer().frame(width: 40)
                //countoff/play
                VStack() {
                    Text("Countoff")
                    //drop down menu?
                    //Rectangle().fill(Color.init(.blue)).frame(width: 95, height: 30)
                    DropDown(initialText: "Number of counts")
                    Spacer().frame(height: 25)
                    //Image(systemName: "play.fill").resizable().frame(width: 60, height: 60)
                    Button(action: {
                        if (playing) {
                            print("Stopping playback")
                        } else {
                            print("Starting playback!")
                        }
                        playing = !playing
                        //print("Swapped states")
                    }) {
                        Image(systemName: playing ? "pause.rectangle" : "play.rectangle").resizable().frame(width: 90, height: 80)
                    }
                }
            }
        }
    }
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
