//
//  sushiSheetView.swift
//  menu_D31
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/26.
//

import SwiftUI

struct sushiSheetView: View {
    
    @Binding var selectedSushi:String
    @Binding var selectedSushiName:String
    @Binding var selectedSushiPrice:Double
    @Binding var sushiSheet:Bool
    
    @State var sushiCost = 0.00
    @State var sushiCount = 0
    var body: some View {
        VStack{
            VStack {
                Image(selectedSushi)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                
                Button(action: {
                    sushiSheet = false
                }, label: {
                    Image(systemName: "arrow.down.circle.fill")
                                        .scaleEffect(2)
                                        .foregroundColor(.red)
                                        .padding(.bottom)
                })
                
            }
            Spacer()
            VStack(alignment: .center){
                Text(selectedSushiName)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.brown)
                Text(selectedSushiName + " is one of the best sushi we make.We are proud to have you come here often, it gives us the zeal to trust our SUSHI!")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom)
                VStack(alignment: .center) {
                    HStack {
                        Image(systemName: "cart.circle.fill")
                        Text("$" + String(selectedSushiPrice))
                            .bold()
                            .padding()
                    }
                    VStack{
                        HStack {
                            VStack {
                                Button(action: {
                                    cartAdd()
                                }, label: {
                                    Image(systemName: "cart.badge.plus")
                                })
                                .foregroundColor(.black)
                            }
                            .padding(.horizontal)
                            VStack {
                                Button(action: {
                                    cartMinus()
                                }, label: {
                                    Image(systemName: "cart.badge.minus")
                                })
                                .foregroundColor(.black)
                            }
                            .padding(.horizontal)
                        }
                    }
                    HStack(alignment: .center){
                        HStack {
                            Text("Sub Total:")
                                .bold()
                            Text("$" + String(sushiCost))
                                .bold()
                                .padding()
                        }
                        HStack {
                            Text("Units:")
                            Text("X" + String(sushiCount))
                                .bold()
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
                Text("Hungry Already?")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                Text("Sushi is Ready!")
                    .bold()
                    .foregroundColor(.red)
            }
        }
    }
    
    func cartAdd(){
        //Add sushi to cart
        sushiCost += selectedSushiPrice
        sushiCount += 1
    }
    func cartMinus(){
        //Remove sushi from cart
        if sushiCost > 0 {
            sushiCost = sushiCost - selectedSushiPrice
            if sushiCount > 0 {
                sushiCount -= 1
            }
        }
        
    }
}

#Preview {
    sushiSheetView(selectedSushi: Binding.constant("tobiko-spicy-maki"), selectedSushiName: Binding.constant("Tobiko Spicy Maki"), selectedSushiPrice: Binding.constant(6.99), sushiSheet: Binding.constant(true))
}
