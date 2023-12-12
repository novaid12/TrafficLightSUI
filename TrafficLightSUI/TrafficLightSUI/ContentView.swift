//
//  ContentView.swift
//  TrafficLightSUI
//
//  Created by  NovA on 11.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var timer: Timer?
    @State private var clickOnOff = true
    @State private var count = 0
    @State private var redLight = RedCircle(alpha: 0.2)
    @State private var yellowLight = YellowCircle(alpha: 0.2)
    @State private var greenLight = GreenCircle(alpha: 0.2)
    @State private var buttonName = "Start"
    var body: some View {
        VStack {
            
            VStack(alignment: .center) {
                redLight
                    .padding(.all, 10)
                yellowLight
                    .padding(.all, 10)
                greenLight
                    .padding(.all, 10)
            }
            .background(Color(.lightGray))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            
            
            
            Spacer()
            HStack {
                Button(
                    action: {
                        if clickOnOff {
                            trafficFunc()
                            clickOnOff.toggle()
                            buttonName = "Stop"
                        } else if !clickOnOff {
                            clickOnOff.toggle()
                            timer?.invalidate()
                            buttonName = "Start"
                        }
                    },
                    label: { Text(buttonName)
                        .frame(width: 150, height: 35)
                        .font(.system(size: 20))
                    }
                )
                .buttonStyle(BlueButton())
            }
     
        }
        .padding()
    }

    func trafficFunc() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            switch count {
            case 0:
                redLight.alpha = 1.0
                yellowLight.alpha = 0.2
                count = 1

            case 1:
                yellowLight.alpha = 1.0
                count = 2

            case 2:
                redLight.alpha = 0.2
                yellowLight.alpha = 0.2
                greenLight.alpha = 1.0
                count = 3

            case 3:
                yellowLight.alpha = 1.0
                greenLight.alpha = 0.2
                count = 0

            default:
                return
            }
        })
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    ContentView()
}
