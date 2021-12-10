//
//  CreationView.swift
//  NewMet
//
//  Created by Sean on 12/5/21.
//

import SwiftUI

struct CreationView: View {
    
    @State var measureInput: String = ""
    @State var signatureInput: String = ""
    @State var tempoInput: String = ""
    
    var body: some View {
        Text("New Preset").font(.largeTitle)
            .padding()
        
        Spacer().frame(height: 100)
        
        VStack() {
            HStack() {
                Spacer().frame(width: 20)
                VStack() {
                    Text("Fill in the following fields for your piece.")
                    Text("For multiple sections, divided the inputs")
                    Text("by commas.")
                }
                // For example, if a song has two sections:
                Spacer().frame(width: 20)
            }
//            Spacer().frame(height: 22)
//            Text("Measures: 8,12")
//            Spacer().frame(height: 5)
//            Text("Time Siganture(s): 3,4")
//            Spacer().frame(height: 5)
//            Text("BPM(s): 120,168")
            Spacer().frame(height: 45)
        }
        
        VStack() {
            VStack() {
                Text("Measures per section:")
                Spacer().frame(height: 5)
                HStack() {
                    Spacer().frame(width: 20)
                    TextField("I.e. 8, 12", text: $measureInput).textFieldStyle(RoundedBorderTextFieldStyle())
                    Spacer().frame(width: 20)
                }
                Spacer().frame(height: 20)
            }
            VStack() {
                Text("Time signature(s) - numerator only:")
                Spacer().frame(height: 5)
                HStack() {
                    Spacer().frame(width: 20)
                    TextField("I.e. 3, 4", text: $signatureInput).textFieldStyle(RoundedBorderTextFieldStyle())
                    Spacer().frame(width: 20)
                }
                Spacer().frame(height: 20)
            }
            VStack() {
                Text("BPM(s):")
                Spacer().frame(height: 5)
                HStack() {
                    Spacer().frame(width: 20)
                    TextField("I.e. 112, 170", text: $tempoInput).textFieldStyle(RoundedBorderTextFieldStyle())
                    Spacer().frame(width: 20)
                }
                Spacer().frame(height: 20)
            }
        }
        
        Spacer().frame(height: 65)
        
        Button(action: {
            print("Measures:", $measureInput)
            print("Signatures:", $signatureInput)
            print("BPMs:", $tempoInput)
            var inputArray = [String].init()
            inputArray.append(self.measureInput)
            inputArray.append(self.signatureInput)
            inputArray.append(self.tempoInput)
            TD.setLST(input: inputArray)
            TD.songIsLoaded()
        }) {
            Text("Load Preset")
        }.buttonStyle(NeumorphicButtonStyle(bgColor: .blue)).frame(width: 140, height: 40)
        
        Spacer().frame(height: 75)
        
    }
}

struct CreationView_Previews: PreviewProvider {
    static var previews: some View {
        CreationView()
    }
}
