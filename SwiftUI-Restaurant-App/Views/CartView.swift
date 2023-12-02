//
//  CartView.swift
//  restaurant
//
//  Created by Mr Ravi on 01/12/23.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var order:Order
    
    func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(order.items) {item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: { indexSet in
                        deleteItems(at: indexSet)
                    })
                }
                
                Section{
                    NavigationLink("Place Order"){
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar(content: {
                EditButton()
            })
        }
    }
}

#Preview {
    CartView()
        .environmentObject(Order())
}
