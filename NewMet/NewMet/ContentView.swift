//
//  ContentView.swift
//  NewMet
//
//  Created by Sean on 10/7/21.
//

//Metronome/main page
import SwiftUI

struct ContentView: View {
    
    var c: Color = .gray;
    
    var body: some View {
        VStack() {
            //title
            Text("New Metronome")
                .padding()
            
            HStack() {
                //speed/division modifiers
                VStack() {
                    Button(action: {}) {
                        Text("X 1/2")
                    }.buttonStyle(NeumorphicButtonStyle(bgColor: .green))
                    Spacer().frame(height: 10)
                    Button(action: {}) {
                        Text("X 2")
                    }.buttonStyle(NeumorphicButtonStyle(bgColor: .green))
                }
                Spacer().frame(width: 70)
                //piece/playback info
                Button(action: {}) {
                    Text("Playback details")
                }.buttonStyle(NeumorphicButtonStyle(bgColor: .gray))
            }
            
            HStack() {
                //sound control
                VStack() {
                    Text("Sound")
                    //drop down menu?
                    Rectangle().fill(Color.init(.blue)).frame(width: 95, height: 30)
                }
                Spacer().frame(width: 50)
                //accent control
                VStack() {
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
            }
            
            Spacer().frame(height: 40)
            
            HStack() {
                //song progression
                Rectangle().fill(c).frame(width: 150, height: 250)
                Spacer().frame(width: 50)
                //countoff/play
                VStack() {
                    Text("Countoff")
                    //drop down menu?
                    Rectangle().fill(Color.init(.blue)).frame(width: 95, height: 30)
                    Spacer().frame(height: 10)
                    Image(systemName: "play.fill").resizable().frame(width: 60, height: 60)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
