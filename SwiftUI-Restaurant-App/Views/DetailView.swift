//
//  DetailView.swift
//  restaurant
//
//  Created by Mr Ravi on 30/11/23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var order:Order
    let item:MenuItem
    var body: some View {
        
        VStack {
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo : \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .foregroundColor(.white)
                    .font(.caption)
                    .offset(x:-5,y:-5)
                
            }
            
            Text(item.description)
                .padding()
            Button("Order This!") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        DetailView(item: MenuItem.example)
            .environmentObject(Order())
    }
    
}
