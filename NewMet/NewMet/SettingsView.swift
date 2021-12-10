//
//  SettingsView.swift
//  NewMet
//
//  Created by Sean on 10/7/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack() {
            Text("This is the settings page")
            Text("Sound selection")
            //drop down menu?
            //Rectangle().fill(Color.init(.blue)).frame(width: 95, height: 30)
            DropDown(initialText: "Choose sound")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
