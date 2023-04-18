//
//  TestResultModelView.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 18/04/23.
//

import Foundation

class MainTestViewModel: ObservableObject {
    @Published var voiceTestViewModel = VoiceTestViewModel()
    @Published var faceTestViewModel = FaceTestViewModel()
    
}

class VoiceTestViewModel: ObservableObject {
    @Published var voiceTest = false

    func voiceTestResult() {
    }
}

class FaceTestViewModel: ObservableObject {
    @Published var faceTest = false
    @Published var mouthPosition: MouthPosition = .none
    
    func faceTestResult () {
        if mouthPosition == .leftSmile || mouthPosition == .rightSmile {
            faceTest = false
        } else {
            faceTest = true
            print("FaceTest TRUE")
        }
    }
}
