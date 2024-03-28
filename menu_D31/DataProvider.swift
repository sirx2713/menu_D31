//
//  DataProvider.swift
//  menu_D31
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/25.
//

import Foundation
import SwiftUI

struct DataProvider{
    //SushiMenuView Data
    func sushiMenuData() -> [SushiLogic]{
        
        if let url = Bundle.main.url(forResource: "SushiMenuData", withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                do{
                    let sushi = try decoder.decode([SushiLogic].self, from: data)
                    return sushi
                }
                catch{
                    print("Could not parse the JSON: \(error)")
                }
            }
            catch{
                print("404: \(error)")
            }
        }
        
        return [SushiLogic]()
    }
}
