//
//  SwiftUIView.swift
//  
//
//  Created by Ariuna Banzarkhanova on 19/04/23.
//

import SwiftUI

struct ProgressView: View {
    var width: CGFloat = 160
    var height: CGFloat = 10
    var percent: CGFloat = 69
    
    var body: some View {
        let multiplier = width/100
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color.black.opacity(0.1))
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: percent * multiplier, height: height)
                .foregroundColor(.accentColor)
        }
    }
}
