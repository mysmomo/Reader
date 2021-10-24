//
//  Setting.swift
//  Reader
//
//  Created by mys_momo on 2021/10/24.
//

import SwiftUI

struct Setting: View {
    @Binding var darkMode: Bool
    var body: some View {
        Button {
            Vibration.selection.vibrate()
            darkMode.toggle()
        } label: {
            Image(systemName: darkMode ? "sun.max.fill" : "moon.fill")
                .font(.system(.headline, design: .rounded))
        }
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting(darkMode: .constant(false))
    }
}
