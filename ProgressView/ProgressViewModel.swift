//
//  File.swift
//  
//
//  Created by Ariuna Banzarkhanova on 20/04/23.
//

import Foundation

class ProgressViewModel: ObservableObject {
    @Published var percent: CGFloat = 0
    
    func startTimer() {
        var timer: Timer?
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            self.percent += 10
            if self.percent >= 100 {
                timer?.invalidate()
                timer = nil
            }
        }
    }
}
