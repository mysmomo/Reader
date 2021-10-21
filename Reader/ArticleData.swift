//
//  ArticleData.swift
//  Reader
//
//  Created by mys_momo on 2021/10/20.
//

import SwiftUI
import Foundation

//定义数据模型
struct Article: Codable, Identifiable{
    var id: Int
    var title: String
    var body: String
}

//定义视图模型，讲视图与模型绑定，Published通知由模型数据变更引起视图变更
class DataValue: ObservableObject{
    @Published var articles = [Article]()
    
    init(){
        let url = URL(string: "https://www.legolas.me/s/articles.json")!
        URLSession.shared.dataTask(with: url) { jsonData, response, Error in
            DispatchQueue.main.async {
                self.articles = try! JSONDecoder().decode([Article].self, from: jsonData!)
            }
        }.resume()
    }
}
