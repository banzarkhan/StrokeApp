//
//  FaceView.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 11/04/23.
//

import SwiftUI

struct FaceView: View {
    @ObservedObject var faceVM: FaceViewModel
    @Binding var animationIsFinished: Bool
    
    var body: some View {
        ZStack{
            ZStack(alignment: .top){
                HostedFaceViewController(faceVM: faceVM)
                    .ignoresSafeArea()
                OverlayFaceView(faceVM: faceVM)
            }
            if faceVM.smileIsDetected {
                LoadingAnimationView(animationIsFinished: $animationIsFinished)
            }
        }
        .onAppear() {
            faceVM.startSpeech()
        }
    }
}

