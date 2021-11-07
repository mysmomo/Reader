//
//  LockedView.swift
//  Reader
//
//  Created by mys_momo on 2021/11/7.
//

import SwiftUI


struct LockedView: View{
    let faceID: () -> ()
    
    var body: some View{
        VStack{
            Text("需要完成身份验证才可使用")
                .padding()
            Button {
                Vibration.light.vibrate()
                faceID()
            } label: {
                Image(systemName: "lock.shield")
                    .font(.system(.largeTitle, design: .rounded))
                Text("点击再次尝试解锁")
                    .bold()
            }
        }
    }
}
