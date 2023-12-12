//
//  GreenCircle.swift
//  TrafficLightSUI
//
//  Created by  NovA on 11.12.23.
//

import SwiftUI

struct GreenCircle: View {
    var alpha = 1.0
    
    var body: some View {
        
        Circle()
            .frame(width: 150, height: 150)
            .foregroundColor(.green)
            .opacity(alpha)
    }
}

#Preview {
    GreenCircle(alpha: 1.0)
}
