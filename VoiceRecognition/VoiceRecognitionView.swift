//
//  VoiceRecognitionView.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 11/04/23.
//

import SwiftUI

struct VoiceRecognitionView: View {
    @ObservedObject var voiceRecVM: VoiceRecognitionViewModel
    
    
    var body: some View {
        ZStack(alignment: .top){
            Rectangle()
                .fill(.linearGradient(Gradient(colors: [.black, .clear]), startPoint: .top, endPoint: .bottom))
                .frame(height: 300)
                .opacity(0.8)
                .ignoresSafeArea()
            VStack {
                Text("Please, repeat after me:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                Text("The sky is blue")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                Text(voiceRecVM.recognizedText)
            }
            .padding()
            if voiceRecVM.isRunning{
                CircleAnimationView()
            }
        }
        .onAppear {
            self.voiceRecVM.startSpeech()
        }
        .fullScreenCover(isPresented: $voiceRecVM.recognitionIsFinished) {
            TestResultMainView(mainTestVM: voiceRecVM.mainTestViewModel)
        }
    }
}
