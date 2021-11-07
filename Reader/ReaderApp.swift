//
//  ReaderApp.swift
//  Reader
//
//  Created by mys_momo on 2021/10/19.
//

import SwiftUI
import LocalAuthentication

@main
struct ReaderApp: App {
    //根据Face ID返回结果来决定是否展示页面
    @State var locked = true
    
    var body: some Scene {
        WindowGroup {
            Group{
                if locked{
                    LockedView(faceID: faceID)
                }else{
                    TabView{
                        ContentView()
                            .tabItem {
                                Label("阅读列表", systemImage: "books.vertical")
                            }
                        ReadNote()
                            .tabItem {
                                Label("笔记", systemImage: "note.text")
                            }
                        
                    }
                }
            }.onAppear {
                faceID()
            }
        }
    }
    
    func faceID(){
        let yanZhen = LAContext()
        var error: NSError?
        
        if yanZhen.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            yanZhen.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "需要身份验证") { result, _ in
                if result{
                    locked = false
                }
            }
        }
    }
    
    
}

