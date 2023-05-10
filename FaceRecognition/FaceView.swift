//
//  FaceView.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 11/04/23.
//

import SwiftUI

struct FaceView: View {
    @ObservedObject var faceVM: FaceViewModel
    @ObservedObject var progressVM: ProgressViewModel
    @Binding var nextStep: Bool
    
    var body: some View {
        ZStack (alignment: .top) {
            HostedFaceViewController(faceVM: faceVM)
                .ignoresSafeArea()
            HStack{
                ProgressView(percent: progressVM.percent)
                ProgressView(percent: 0)
            }
        }
        .overlay(OverlayFaceView(faceVM: faceVM, nextStep: $nextStep), alignment: .bottom)
        .onAppear() {
            faceVM.startSpeech()
            progressVM.startTimer()
        }
    }
}
