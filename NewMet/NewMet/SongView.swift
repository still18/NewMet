//
//  SongView.swift
//  NewMet
//
//  Created by Sean on 10/13/21.
//

import SwiftUI

struct SongView: View {
    var body: some View {
        VStack {
            Text("eediot")
            Menu {
                Button {
                } label: {
                    Text("Linear")
                    Image(systemName: "arrow.down.right.circle")
                }
                Button {
                } label: {
                    Text("Radial")
                    Image(systemName: "arrow.up.and.down.circle")
                }
            } label: {
                 Text("Style")
                 Image(systemName: "tag.circle")
            }
        }
        //piece/playback info
//                Button(action: {}) {
//                    Text("Playback details")
//                }.buttonStyle(NeumorphicButtonStyle(bgColor: .gray))

    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView()
    }
}
