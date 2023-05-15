//
//  ContentView.swift
//  ALPSE
//
//  Created by ilham risqi on 15/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: ManageBudgetView(manageBudget: ManageBudget())) {
                    Text("Manage Budget")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
//                NavigationLink(destination: ) {
//                    Text("Manage Expense")
//                        .frame(maxWidth: .infinity)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                
//                NavigationLink(destination: ) {
//                    Text("Expense History")
//                        .frame(maxWidth: .infinity)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                
//                NavigationLink(destination:) {
//                    Text("Money Converter")
//                        .frame(maxWidth: .infinity)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                
//                NavigationLink(destination: ) {
//                    Text("Expense Kategori")
//                        .frame(maxWidth: .infinity)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                
                Spacer()
            }
            .padding()
            .navigationTitle("Budget Tracker")
        }
    }
}

