//
//  DevicesViewModel.swift
//  Android Mirroring
//
//  Created by Kush Choudhary on 05/07/25.
//

import Foundation

@MainActor
class DevicesViewModel: ObservableObject{
    @Published var devices: [Device] = []
    
    func getDevices() async {
        let tokens = await runCommand([adbPath, "devices", "-l"]).dropFirst(4).filter { !$0.isEmpty }
        var tempDevices: [Device] = []
        
        var i = 0
        while i < tokens.count-1 {
            var serial = tokens[i]
            var status = tokens[i+1]
            if(status == "unauthorized"){
                tempDevices.append(Device(serial: tokens[i], status: tokens[i+1], model: ""))
                i = i+4
            }
            else {
                tempDevices.append(Device(serial: tokens[i], status: tokens[i+1], model: String(tokens[i+5].dropFirst(7))))
                i = i+7
            }
            
        }
        
        devices = tempDevices

        print(devices)
    }
    
    func startMirroring(serial: String) async {
        _ = await runCommand([scrcpyPath, "-s", serial])
    }

}
