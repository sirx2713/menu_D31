//
//  SushiLogic.swift
//  menu_D31
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/25.
//

import Foundation
import SwiftUI

struct SushiLogic: Identifiable, Decodable{
    
    let id: UUID = UUID()
    var name:String
    var price:Int
    var imageName:String
    
}
