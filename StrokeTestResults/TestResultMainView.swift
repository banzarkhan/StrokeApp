//
//  TestResultView.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 15/04/23.
//

import SwiftUI

struct TestResultMainView: View {
    @ObservedObject var mainTestVM: MainTestViewModel
    
    var body: some View {
        NavigationView {
            if mainTestVM.faceTestViewModel.faceTest && mainTestVM.voiceTestViewModel.voiceTest {
                VStack{
                    Text("Test results indicate no stroke symptoms found, but consult a doctor if you still feel unwell.")
                        .multilineTextAlignment(.center)
                }
                .navigationTitle("No symptoms detected")
            } else if !mainTestVM.faceTestViewModel.faceTest && !mainTestVM.voiceTestViewModel.voiceTest {
                HostedMessageViewController()
            } else {
                Text("fdkhkhdfkh")
            }
        }
    }
}

//struct TestResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestResultView()
//    }
//}
