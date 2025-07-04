//
//  ContentView.swift
//  Android Mirroring
//
//  Created by Kush Choudhary on 30/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack {
            
            // Device Section
            VStack(spacing: 12) {
                HStack{
                    Text("Devices")
                        .font(.largeTitle)
                    Spacer()
                }
                
                Image(systemName: "iphone.slash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .foregroundColor(.secondary)
                
                Text("No Devices Found")
                    .font(.title)
                
                Text("Plug in your android device via USB and enable \"USB Debugging\"")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.secondarySystemFill))
            .cornerRadius(20)
            
            Spacer()
            
            HStack() {
                Text("scrcpy: 2.1.1")
                Spacer()
                    .frame(width: 20)
                Text("adb: 34.1.2")
            }
            
        }
        .padding()
        .frame(minWidth: 500, maxWidth: 500, minHeight: 500, maxHeight: 500)
    }
}
#Preview {
    ContentView()
}
