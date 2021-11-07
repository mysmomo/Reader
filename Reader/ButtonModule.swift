//
//  ButtonModule.swift
//  Reader
//
//  Created by mys_momo on 2021/11/8.
//

import SwiftUI

struct ButtonModule: View {
    let text: String
    let img: String
    
    
    var body: some View {
        HStack{
            Text(text)
            Image(systemName: img)
        }
        .font(.headline)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}
