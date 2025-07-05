//
//  VersionViewModel.swift
//  Android Mirroring
//
//  Created by Kush Choudhary on 04/07/25.
//


import Foundation

@MainActor
class VersionViewModel: ObservableObject {
    @Published var scrcpyVersion: String = "Loading..."
    @Published var adbVersion: String = "Loading..."

    func getVersions() async {
        if(scrcpyPath == "Not Found" || adbPath == "Not Found"){
            print("SCRCPY or ADB not found")
            scrcpyVersion = scrcpyPath
            adbVersion = adbPath
            return
        }
        scrcpyVersion = await runCommand([scrcpyPath, "--version"])[1]
        adbVersion = await runCommand([adbPath, "--version"])[4]
    }
}
