//
//  TabNoteData.swift
//  Reader
//
//  Created by mys_momo on 2021/11/8.
//

import Foundation

//note model

struct Note: Codable,Identifiable{
    var id: UUID
    var title: String
    var content: String
}

//创建一个类，让其在数据变更时通知视图
class TabNoteData: ObservableObject{
    @Published var notes: [Note] = []
    //用文件管理器获取沙盒地址
    static let sandboxURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let notesURL = sandboxURL.appendingPathComponent("notes.json")
    
    init(){
        notes = getNotes()
    }
    
    func getNotes() -> [Note]{
        var result: [Note] = []
        if FileManager.default.fileExists(atPath: notesURL.path){
            let data = try! Data(contentsOf: notesURL)
            result = try! JSONDecoder().decode([Note].self, from: data)
        }
        return result
    }
    
    func saveNotes(){
        DispatchQueue.global(qos: .userInitiated).async {
            let data = try? JSONEncoder().encode(self.notes)
            try? data?.write(to: self.notesURL)
        }
    }
}
