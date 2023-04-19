//
//  FaceView.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 11/04/23.
//

import SwiftUI

struct FaceView: View {
    @ObservedObject var faceVM: FaceViewModel
    @Binding var nextStep: Bool
    
    var body: some View {
        ZStack{
            ZStack(alignment: .top){
                HostedFaceViewController(faceVM: faceVM)
                    .ignoresSafeArea()
            }
        }
        .overlay(OverlayFaceView(faceVM: faceVM, nextStep: $nextStep), alignment: .bottom)
        .onAppear() {
            faceVM.startSpeech()
        }
    }
}

