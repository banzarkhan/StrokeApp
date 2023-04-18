import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var animationIsFinished = false
    @ObservedObject var mainTestViewModel: MainTestViewModel = .init()
    
    var body: some View {
        if animationIsFinished {
            VoiceRecognitionView(voiceRecVM: VoiceRecognitionViewModel(mainTestViewModel: mainTestViewModel))
        } else {
            FaceView(faceVM: FaceViewModel(mainTestVM: mainTestViewModel), animationIsFinished: $animationIsFinished)
        }
    }
}
