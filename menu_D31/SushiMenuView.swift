//
//  ContentView.swift
//  menu_D31
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/25.
//

import SwiftUI

struct SushiMenuView: View {
    
    @State var selectedSushi = ""
    @State var selectedSushiName = ""
    @State var selectedSushiPrice:Double
    @State var sushiSheet = false
    @State var sushiList = [SushiLogic]()
    var sushiDataFetch = DataProvider()
    
    var body: some View {
        List(sushiList){sushi in
            HStack{
                Image(sushi.imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                Text(sushi.name)
                    .bold()
                Spacer()
                Text("$" + String(sushi.price))
                
            }
            .onTapGesture {
                
                sushiSheet = true
                selectedSushi = sushi.imageName
                selectedSushiName = sushi.name
                selectedSushiPrice = Double(sushi.price)
                
            }
            .listRowBackground(
                Color(.brown)
                    .opacity(0.2))
            
        }
        .sheet(isPresented: $sushiSheet, content: {
            sushiSheetView(selectedSushi: $selectedSushi, selectedSushiName: $selectedSushiName, selectedSushiPrice: $selectedSushiPrice, sushiSheet: $sushiSheet)
        })
        .listStyle(.plain)
        .onAppear(perform: {
            sushiList = sushiDataFetch.sushiMenuData()
        })
    }
}

#Preview {
    SushiMenuView(selectedSushiPrice: 6.99)
}
