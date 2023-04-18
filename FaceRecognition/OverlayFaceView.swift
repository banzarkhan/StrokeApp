//
//  CardFaceView.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 12/04/23.
//

import SwiftUI

struct OverlayFaceView: View {
    @ObservedObject var faceVM: FaceViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.linearGradient(Gradient(colors: faceVM.smileIsDetected ? [.green, .clear]:[.black, .clear]), startPoint: .top, endPoint: .bottom))
                .animation(.easeIn(duration: 1.0), value: faceVM.smileIsDetected)
                .frame(height: 221)
                .opacity(0.7)
                .ignoresSafeArea()
            Text(faceVM.smileIsDetected ? "Done!": "Please smile")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.top, 50)
        }
        .preferredColorScheme(.dark)
    }
}

//struct CardFaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardFaceView()
//    }
//}
