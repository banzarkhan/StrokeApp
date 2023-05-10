//
//  VoiceRecognitionView.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 11/04/23.
//

import SwiftUI

struct VoiceRecognitionView: View {
    @ObservedObject var voiceRecVM: VoiceRecognitionViewModel
    @ObservedObject var progressVM: ProgressViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    ProgressView(percent: 100)
                    ProgressView(percent: progressVM.percent)
                }
                .padding()
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
                    .foregroundColor(.black)
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
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("bgColor"))
        .ignoresSafeArea()
        .onAppear {
            voiceRecVM.startSpeech()
            progressVM.startTimer()
        }
        .fullScreenCover(isPresented: $voiceRecVM.recognitionIsFinished) {
            ResultMainView(voiceRecVM: voiceRecVM)
        }
    }
}
