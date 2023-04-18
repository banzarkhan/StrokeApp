//
//  FaceViewModel.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 12/04/23.
//

import Foundation
import SwiftUI
import Speech

class FaceViewModel: ObservableObject {
    @Published var smileIsDetected = false
    @Published var mainTestVM: MainTestViewModel
    
    init(mainTestVM: MainTestViewModel){
        self.mainTestVM = mainTestVM
    }
    
    let syntesizer = AVSpeechSynthesizer()
    
    func startSpeech() {
        let utterance = AVSpeechUtterance(string: "Please, smile")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        syntesizer.speak(utterance)
    }
}

enum MouthPosition {
    case leftSmile
    case rightSmile
    case smile
    case none
}
