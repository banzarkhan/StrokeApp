//
//  CircleAnimationView.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 12/04/23.
//
// animation was download from LottieFiles.com
// https://lottiefiles.com/98125-blue-pulsing-circle
//

import Foundation
import SwiftUI
import Lottie

struct CircleAnimationView: UIViewRepresentable {
    
    let circleView = LottieAnimationView()
    var fileName = "98125-blue-pulsing-circle"
    
    func makeUIView(context: UIViewRepresentableContext<CircleAnimationView>) -> some UIView {
        let view = UIView()
        
        let animation = LottieAnimation.named(fileName)
        circleView.animation = animation
        circleView.contentMode = .scaleAspectFit
        circleView.loopMode = .loop
        circleView.play()
        
        circleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circleView)
        
        NSLayoutConstraint.activate([
            circleView.heightAnchor.constraint(equalTo: view.heightAnchor),
            circleView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
