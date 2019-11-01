//
//  ContentView.swift
//  SwiftUI3DRotationAnimationLoadingSpinner
//
//  Created by ramil on 31.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var spin3D_x = false
    @State private var spin3D_y = false
    @State private var spin3D_xy = false
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.white, Color.blue]), center: .center, startRadius: 5, endRadius: 500)
                .scaleEffect(1.5)
            Circle() // Large cicrle
                .stroke(lineWidth: 5)
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .rotation3DEffect(.degrees(spin3D_x ? 180 : 1), axis: (x: spin3D_x ? 1 : 0, y: 0, z: 0))
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear() {
                    self.spin3D_x.toggle()
            }
            Circle() // Middle circle
            .stroke(lineWidth: 5)
                .frame(width: 60, height: 60)
                .foregroundColor(.blue)
                .rotation3DEffect(.degrees(spin3D_y ? 360 : 1), axis: (x: 0, y: spin3D_y ? 1 : 0, z: 0))
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false))
                .onAppear() {
                    self.spin3D_y.toggle()
            }
            Circle() // Inner circle
            .stroke(lineWidth: 5)
                .frame(width: 20, height: 20)
                .foregroundColor(.blue)
                .rotation3DEffect(.degrees(spin3D_xy ? 360 : 1), axis: (x: spin3D_xy ? 0 : 1, y: spin3D_xy ? 0: 1, z: 0))
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear() {
                    self.spin3D_xy.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
