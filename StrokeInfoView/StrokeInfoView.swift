//
//  StrokeInfoView.swift
//  StrokeApp
//
//  Created by Ariuna Banzarkhanova on 19/04/23.
//

import SwiftUI

struct StrokeInfoView: View {
    var body: some View {
        NavigationView{
            VStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .frame(width: 356, height: 62)
                    Text("""
Stroke is a medical emergency caused
by disrupted blood supply to the brain.
""")
                    .frame(width: 325)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                }
                .padding(.top, 20)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .frame(width: 356, height: 125)
                    HStack{
                        Text("""
Risk factors for stroke include:
- high blood pressure,
- smoking,
- diabetes,
- high cholesterol.
""")
                        .frame(width: 325)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 5)
                        Spacer()
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .frame(width: 356, height: 180)
                    Text("""
Remember the acronym **F.A.S.T**.
to recognize and respond
to the symptoms of stroke:

**F** - Face drooping
**A** - Arm weakness
**S** - Speech difficulty
**T** - Time to call emergency services
""")
                    .frame(width: 325)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, -10)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .frame(width: 356, height: 167)
                    Text("""
If you or someone you know is
experiencing these symptoms,
**call emergency services immediately.**

Early treatment can minimize damage
and improve outcomes.
""")
                    .frame(width: 325)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                }
                .padding(.top, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("bgColor"))
            .ignoresSafeArea()
            .navigationTitle("Information")
            .preferredColorScheme(.light)
        }
    }
}
