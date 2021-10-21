//
//  NewsSource.swift
//  Reader
//
//  Created by mys_momo on 2021/10/19.
//

import SwiftUI

struct Row: View{
    var article: Article
    var body: some View{
        VStack(alignment: .leading){
            Text(article.title)
                .font(.title3)
                .bold()
                .padding(.bottom, 3)
            Text(article.body)
                .lineLimit(3)
        }
    }
}
