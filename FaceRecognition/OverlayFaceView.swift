//
//  CardFaceView.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 12/04/23.
//

import SwiftUI

struct OverlayFaceView: View {
    @ObservedObject var faceVM: FaceViewModel
    @State var messageIsOpen = false
    @Binding var nextStep: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .ignoresSafeArea()
                .foregroundColor(Color("bgColor"))
                .frame(height: 248)
            if faceVM.mouthPosition == .none {
                startView
            } else if faceVM.mouthPosition == .smile {
                goodView
            } else {
                emergencyView
            }
        }.sheet(isPresented: $messageIsOpen) {
            MessageView()
        }
    }
}


extension OverlayFaceView {
    
    private var startView: some View {
        VStack{
            Text("Please smile")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text("🙂")
                .font(.system(size: 80))
            Text("""
             Make sure your face
             remains in the camera view
             """)
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
        }
    }
    
    private var goodView: some View {
        VStack{
            Text("All good!")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text("✅")
                .font(.system(size: 80))
        }
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                nextStep = true
            }
        }
    }
    
    private var emergencyView : some View {
        VStack (spacing: 30){
            VStack{
                Text("Warning!")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                Text("Face paralysis detected")
                    .foregroundColor(.black)
            }
            Button {
                messageIsOpen.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.red)
                        .frame(width: 373, height: 64)
                    Text("Send emergency message")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
            }
        }
    }
}
