//
//  CheckoutView.swift
//  restaurant
//
//  Created by Mr Ravi on 02/12/23.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order:Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyalityNumber = ""
    @State private var tipAmount = 15
    @State private var showPaymentAlert = false
    
    let paymentTypes = ["Credit Card", "Cash", "Points"]
    let tipAmounts = [5,10,15,20,25,0]
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total * (Double(tipAmount)/100.0)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form{
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self){ item in
                        Text(item)
                    }
                }
                Toggle("Add restaurant loyalty card", isOn: $addLoyaltyDetails.animation(.interactiveSpring))
                if addLoyaltyDetails {
                    TextField("Enter your loyalty ID", text: $loyalityNumber)
                }
                Picker("Tip", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) { item in
                        Text("\(item)%")
                    }
                }
                .pickerStyle(.segmented)
                
            }
            Section("Total : \(totalPrice)") {
                Button("Confirm Order") {
                    showPaymentAlert.toggle()
                }
            }
        }
        .alert("", isPresented: $showPaymentAlert, actions: {
            
        }, message: {
            Text("Your total was \(totalPrice). Thank You!")
        })
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView().environmentObject(Order())
}
