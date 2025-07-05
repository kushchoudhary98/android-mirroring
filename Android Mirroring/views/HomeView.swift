//
//  HomeView.swift
//  Android Mirroring
//
//  Created by Kush Choudhary on 05/07/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var versions = VersionViewModel()
    @StateObject private var devicesViewModel = DevicesViewModel()
    
    var body: some View {
        VStack {
            HStack{
                Text("Devices")
                    .font(.largeTitle)
                Button(action: {
                    Task {
                        await devicesViewModel.getDevices()
                    }
                }) {
                    Image(systemName: "arrow.clockwise")
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.vertical)
                
                Spacer()
            }
            .padding()
            
            if devicesViewModel.devices.isEmpty {
                noDeviceFound
            } else {
                devicesFound
            }
            
            
            Spacer()
            
            HStack() {
                Text("scrcpy: \(versions.scrcpyVersion)")
                Spacer()
                    .frame(width: 20)
                Text("adb: \(versions.adbVersion)")
            }
            .task {
                await versions.getVersions()
            }
            
        }
        .frame(minWidth: 400, maxWidth: 400, minHeight: 500, maxHeight: 500)
        .task {
            await devicesViewModel.getDevices()
        }
        .padding()
    }
    
    var devicesFound: some View{
        VStack(alignment: .leading) {
            List(devicesViewModel.devices) { device in
                HStack() {
                    VStack(alignment: .leading) {
                        Text(device.model == "" ? device.serial : device.model)
                            .font(.title2)
                    }
                    Spacer()
                    if(device.status == "unauthorized"){
                        Text(device.status)
                            .font(.title3)
                            .opacity(0.5)
                            
                    } else{
                        Button(action: {
                            Task{
                                await devicesViewModel.startMirroring(serial: device.serial)
                            }
                        }){
                            Text("Start Mirroring")
                        }
                    }
                }
                .padding(.vertical)
            }
            
        }
    }
    
    var noDeviceFound: some View{
        VStack(spacing: 12) {
            Image(systemName: "iphone.slash")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .foregroundColor(.secondary)
            
            Text("No Device Found")
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
    }
}

#Preview {
    HomeView()
}
