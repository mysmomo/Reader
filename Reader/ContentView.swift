//
//  ContentView.swift
//  Reader
//
//  Created by mys_momo on 2021/10/19.
//

import SwiftUI

struct ContentView: View {
    //将视图和数据模型关联起来，并接受published更新
    @StateObject var publishedData = DataValue()
    @AppStorage("darkMode") var darkMode = false
    
    var body: some View {
        NavigationView{
            List(publishedData.articles){ article in
                NavigationLink(destination: Detail(article: article)) {
                    Row(article: article)
                }
            }
            .navigationTitle("编辑推荐")
            .toolbar {
                Setting(darkMode: $darkMode)
                
            }
        }
        .preferredColorScheme(darkMode ? .dark : .light)        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
