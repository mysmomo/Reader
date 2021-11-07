//
//  ReadNote.swift
//  Reader
//
//  Created by mys_momo on 2021/11/8.
//

import SwiftUI

struct ReadNote: View {
    var body: some View {
        NavigationView{
            ScrollView{
                Link(destination: URL(string: "https://legolas.me")!) {
                    ButtonModule(text: "在Safari打开", img: "safari")
                }
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
