//
//  TestResultView.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 15/04/23.
//

import SwiftUI

struct ResultMainView: View {
    @ObservedObject var voiceRecVM: VoiceRecognitionViewModel
    @State var messageIsOpened = false
    @State var infoIsOpened = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    ProgressView(percent: 100)
                    ProgressView(percent: 100)
                }
                if voiceRecVM.speechCheck == .bad{
                    VStack{
                        Text("Warning!")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                            .padding()
                        Text("Speech dificulty detected")
                            .foregroundColor(.black)
                    }
                    .padding()
                }
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        infoIsOpened.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 47, height: 48)
                            .foregroundColor(.accentColor)
                    }
                }
            }
            .padding()
            if voiceRecVM.speechCheck == .good {
                goodView
            } else {
                    emergencyView
            }
        }
        .background(Color("bgColor"), ignoresSafeAreaEdges: .all)
        .sheet(isPresented: $messageIsOpened){
            MessageView()
        }
        .sheet(isPresented: $infoIsOpened) {
            StrokeInfoView()
        }
    }
}

extension ResultMainView {
    
    private var goodView: some View {
        ZStack {
            VStack {
                Text("All good!")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.top, 30)
                Text("✅")
                    .font(.system(size: 80))
                Spacer()
            }
            .padding()
            VStack {
                Text("Not Detected")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                Text("Test results indicate no stroke symptoms found, but please contact a doctor if you still feel unwell")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
    
    private var emergencyView: some View {
            Button {
                messageIsOpened.toggle()
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
