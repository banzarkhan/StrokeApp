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
    @Published var mouthPosition: MouthPosition = .none
    
    let syntesizer = AVSpeechSynthesizer()
    
    func startSpeech() {
        let utterance = AVSpeechUtterance(string: "Please, smile")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        syntesizer.speak(utterance)
    }
}
