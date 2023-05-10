//
//  CameraViewController.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 09/04/23.
//

import UIKit
import ARKit
import SwiftUI
import Speech

class FaceViewController: UIViewController {
    
    let trackingView = ARSCNView()
    let label = UILabel()
    let faceVM: FaceViewModel
    
    init(faceVM: FaceViewModel){
        self.faceVM = faceVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard ARFaceTrackingConfiguration.isSupported else {
            fatalError("ARKit is not supported on this device")
        }
        
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { granted in
            if (granted) {
                DispatchQueue.main.sync {
                    self.setupMouthTracker()
                }
            } else {
                fatalError("This app needs Camera Access to function")
            }
        }
    }
    
    func setupMouthTracker() {
        
        let configuration = ARFaceTrackingConfiguration()
        configuration.isLightEstimationEnabled = true
        
        trackingView.session.run(configuration)
        trackingView.delegate = self
        trackingView.frame = view.bounds
        
        view.addSubview(trackingView)
    }
    
    func handleSmile(leftSmileValue: CGFloat, rightSmileValue: CGFloat) {
        if faceVM.smileIsDetected {
            return
        }
        if (leftSmileValue + rightSmileValue)/2 > 0.5 {
            faceVM.mouthPosition = .smile
            faceVM.smileIsDetected = true
        }
        else if rightSmileValue > 0.3 && leftSmileValue < 0.3{
            faceVM.mouthPosition = .rightSmile
            faceVM.smileIsDetected = true
        }
        else if leftSmileValue > 0.3 && rightSmileValue < 0.3{
            faceVM.mouthPosition = .leftSmile
            faceVM.smileIsDetected = true
        }
        else {
        }
    }
    
}

extension FaceViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor else { return }
        
        let leftMouthSmileValue = faceAnchor.blendShapes[.mouthSmileLeft] as! CGFloat
        let rightMouthSmileValue = faceAnchor.blendShapes[.mouthSmileRight] as! CGFloat
        
        DispatchQueue.main.async {
            self.handleSmile(leftSmileValue: leftMouthSmileValue, rightSmileValue: rightMouthSmileValue)
        }
    }
}

struct HostedFaceViewController: UIViewControllerRepresentable {
    @ObservedObject var faceVM: FaceViewModel
    
    func makeUIViewController(context: Context) -> FaceViewController {
        return FaceViewController(faceVM: faceVM)
    }
    
    func updateUIViewController(_ uiViewController: FaceViewController, context: Context) {
    }
}
