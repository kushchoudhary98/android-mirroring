//
//  Device.swift
//  Android Mirroring
//
//  Created by Kush Choudhary on 05/07/25.
//

import Foundation


struct Device: Identifiable, Hashable {
    let id = UUID()
    var serial: String
    var status: String // "device", "unauthorized"
    var model: String
}
