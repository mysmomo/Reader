//
//  TouchVibration.swift
//  Reader
//
//  Created by mys_momo on 2021/10/24.
//

import SwiftUI

enum Vibration{
    case error
    case sucess
    case light
    case selection
    
    func vibrate(){
        switch self {
        case .error:
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        case .sucess:
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        case .light:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case .selection:
            UISelectionFeedbackGenerator().selectionChanged()
        }
    }
}
