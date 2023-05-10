//
//  VoiceRecognitionViewModel.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 11/04/23.
//
import Foundation
import SwiftUI
import Speech

class VoiceRecognitionViewModel: NSObject, ObservableObject, AVSpeechSynthesizerDelegate {
    @Published private(set) var recognizedText = ""
    @Published private(set) var isRunning = false
    @Published var speechCheck: SpeechCheck = .none
    @Published var recognitionIsFinished = false
    
    let customPhrase = "The sky is blue"
    
    let syntesizer = AVSpeechSynthesizer()
    
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    var recognitionTask: SFSpeechRecognitionTask?
    let audioEngine = AVAudioEngine()
    
    override init() {
        super.init()
        syntesizer.delegate = self
    }
    
    func start() {
        SFSpeechRecognizer.requestAuthorization { status in
            DispatchQueue.main.async {
                self.startRecognition()
            }
        }
    }
    
    func startRecognition() {
        do {
            recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
            guard let recognitionRequest = recognitionRequest else { return }
            
            recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
                if let result = result {
                    self.recognizedText = result.bestTranscription.formattedString
                }
            }
            
            let recordingFormat = audioEngine.inputNode.outputFormat(forBus: 0)
            audioEngine.inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
                recognitionRequest.append(buffer)
            }
            
            audioEngine.prepare()
            try audioEngine.start()
            
            self.recognizedText = ""
            self.isRunning = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
                self.stop()
                self.speechTest()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                    self.recognitionIsFinished = true
                }
            }
        }
        catch {
        }
    }
    
    func startSpeech() {
        let utterance = AVSpeechUtterance(string: "Please, repeat after me: The sky is blue")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        syntesizer.speak(utterance)
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.start()
        print("Speech finished.")
    }
    func stop() {
        audioEngine.inputNode.removeTap(onBus: 0)
        audioEngine.stop()
        recognitionRequest?.endAudio()
        self.isRunning = false
    }
    
    func speechTest () {
        if recognizedText == customPhrase {
            speechCheck = .good
        } else {
            speechCheck = .bad
        }
    }
}
