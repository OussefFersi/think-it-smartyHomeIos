//
//  Room.swift
//  smartyhome
//
//  Created by Oussef Fersi on 18/3/2021.

//

import UIKit

struct Room {

    var name:String?
    var numberOfDevices:Int = 0
    var image:String?
    
    init(name:String, numberOfDevices:Int,image:String){
        self.name = name
        self.numberOfDevices = numberOfDevices
        self.image = image
    }
}
