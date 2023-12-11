//
//  YellowCircle.swift
//  TrafficLightSUI
//
//  Created by  NovA on 11.12.23.
//

import SwiftUI

struct YellowCircle: View {
    var alpha = 1.0
    
    var body: some View {
        
        Circle()
            .frame(width: 150, height: 150)
            .foregroundColor(.yellow)
            .opacity(alpha)
    }
}

#Preview {
    YellowCircle(alpha: 1.0)
}
