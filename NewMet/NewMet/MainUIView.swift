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
            SongView().tabItem {
                Image(systemName: "music.note.list")
                Text("Preset")
            }
            
            ContentView().tabItem {
                Image(systemName: "metronome")
                Text("Basic")
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


/*TODO:
 - Variation of sounds between accent clicks and regular ones
 - Show (6?) accent buttons, grey out ones that do not need to be there
 */

