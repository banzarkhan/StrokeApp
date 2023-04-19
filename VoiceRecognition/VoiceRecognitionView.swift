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
        ZStack {
            VStack {
                Text("Please, repeat after me:")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.top, 30)
                Text("🎤")
                    .font(.system(size: 80))
                Spacer()
                Text(voiceRecVM.recognizedText)
            }
            .padding()
            ZStack {
                if voiceRecVM.isRunning{
                    CircleAnimationView()
                }
                Text("The sky is blue")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("bgColor"))
        .ignoresSafeArea()
        .onAppear {
            self.voiceRecVM.startSpeech()
        }
        .fullScreenCover(isPresented: $voiceRecVM.recognitionIsFinished) {
            ResultMainView(voiceRecVM: voiceRecVM)
        }
    }
}
