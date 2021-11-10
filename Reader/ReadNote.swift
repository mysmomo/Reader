//
//  ReadNote.swift
//  Reader
//
//  Created by mys_momo on 2021/11/8.
//

import SwiftUI
import BetterSafariView

struct ReadNote: View {
    @State private var isPresentSafariView = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    //使用系统浏览器打开
                    Link(destination: URL(string: "https://legolas.me")!) {
                        ButtonModule(text: "在Safari打开", img: "safari")
                    }
                    
                    //在app内部使用safari框架打开
                    Button {
                        self.isPresentSafariView = true
                    } label: {
                        ButtonModule(text: "在当前应用打开", img: "arrow.up.forward.app")
                    }
                    .safariView(isPresented: $isPresentSafariView) {
                        SafariView(url: URL(string: "https://legolas.me")!, configuration: SafariView.Configuration(entersReaderIfAvailable: false, barCollapsingEnabled: false))
                            .preferredBarAccentColor(.clear)
                            .preferredControlAccentColor(.accentColor)
                            .dismissButtonStyle(.done)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("笔记")
        }
    }
}

struct ReadNote_Previews: PreviewProvider {
    static var previews: some View {
        ReadNote()
    }
}
