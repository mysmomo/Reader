//
//  NoteWrite.swift
//  Reader
//
//  Created by mys_momo on 2021/11/10.
//

import SwiftUI

struct NoteWrite: View {
    @StateObject var noteData = TabNoteData()
    @State var titleInput = ""
    @State var contentInput = ""
    
    var body: some View {
        //存储新笔记
        
        VStack {
            VStack{
                TextField("标题", text: $titleInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("笔记", text: $contentInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack{
                    Spacer()
                    Button {
                        let id = UUID()
                        let newNote = Note(id: id, title: titleInput, content: contentInput)
                        
                        noteData.notes.append(newNote)
                        noteData.saveNotes()
                        
                        titleInput = ""
                        contentInput = ""
                        
                    } label: {
                        ButtonModule(text: "保存笔记", img: "note.text.badge.plus")
                    }
                    
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 3)
            .padding()
            
            //读取现有笔记
            List{
                ForEach(noteData.notes){ note in
                    VStack(alignment: .leading, spacing: 10){
                        Text(note.title)
                            .font(.title3)
                            .bold()
                        Text(note.content)
                    }
                }
                .onDelete(perform: delete)
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
    //删除笔记函数
    func delete(at offsets: IndexSet){
        noteData.notes.remove(atOffsets: offsets)
        noteData.saveNotes()
    }
}

struct NoteWrite_Previews: PreviewProvider {
    static var previews: some View {
        NoteWrite()
    }
}
