import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var nextStep = false
    
    var body: some View {
        if nextStep {
            VoiceRecognitionView(voiceRecVM: VoiceRecognitionViewModel())
        } else {
        FaceView(faceVM: FaceViewModel(), nextStep: $nextStep)
        }
//        MessageView()
    }
}
