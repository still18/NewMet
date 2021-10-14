//
//  MainUIView.swift
//  NewMet
//
//  Created by Sean on 10/7/21.
//

import SwiftUI

struct MainUIView: View {
    var body: some View {
        
        TabView {
            ContentView().tabItem {
                Image(systemName: "metronome")
                Text("Metronome")
            }
            
            SongView().tabItem {
                Image(systemName: "music.note.list")
                Text("Presets")
            }
            
            SettingsView().tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
        
    }
}

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView()
    }
}
