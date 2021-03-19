//
//  RoomViewModel.swift
//  smartyhome
//
//  Created by Oussef Fersi on 18/3/2021.
//

import Foundation
import UIKit
struct RoomViewModel {

    let name:String
    let description:String
    let image:UIImage
    
    init(_ room:Room) {
        name = room.name ?? "UnKown"
        description = room.numberOfDevices > 1 ? "\(room.numberOfDevices) Devices" : "\(room.numberOfDevices) Device"
        image = (room.image != nil) ? UIImage(named: room.image!)! : UIImage()
    }
}
