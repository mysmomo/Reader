//
//  NewsDetail.swift
//  Reader
//
//  Created by mys_momo on 2021/10/21.
//

import SwiftUI

struct Detail: View{
    var article: Article
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading){
                Text(article.body)

            }.padding()

        }.navigationTitle(article.title)
    }
    
}

