//
//  LoadingAnimationView.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 15/04/23.
//

import Foundation
import SwiftUI
import Lottie

struct LoadingAnimationView: UIViewRepresentable {
    
    let loadingView = LottieAnimationView()
    var fileName = "98288-loading"
    
    @Binding var animationIsFinished: Bool
    
    func makeUIView(context: UIViewRepresentableContext<LoadingAnimationView>) -> some UIView {
        let view = UIView()
        
        let animation = LottieAnimation.named(fileName)
        loadingView.animation = animation
        loadingView.contentMode = .scaleAspectFit
        
        loadingView.play { finished in
            self.animationDidFinish(success: finished)
        }
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingView)
        
        NSLayoutConstraint.activate([
            loadingView.heightAnchor.constraint(equalTo: view.heightAnchor),
            loadingView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
    func animationDidFinish(success: Bool) {
            if success {
                animationIsFinished = true
                print("Animation finished successfully")
            } else {
                print("Animation was interrupted")
            }
        }
}
