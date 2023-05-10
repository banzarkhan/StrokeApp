import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var nextStep = false
    
    var body: some View {
        if nextStep {
            VoiceRecognitionView(voiceRecVM: VoiceRecognitionViewModel(), progressVM: ProgressViewModel())
        } else {
            FaceView(faceVM: FaceViewModel(), progressVM: ProgressViewModel(), nextStep: $nextStep)
        }
    }
}
