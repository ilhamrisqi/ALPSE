//
//  ManageBudgetView.swift
//  ALPSE
//
//  Created by ilham risqi on 15/05/23.
//

import SwiftUI

struct ManageBudgetView: View {
    @ObservedObject var manageBudget: ManageBudget
    @State private var name = ""
    @State private var category = ""
    @State private var amount = ""
    @State private var selectedDate = Date()

    var body: some View {
        Form {
            Section(header: Text("Budget Details")) {
                TextField("Name", text: $name)
                TextField("Category", text: $category)
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
            }
            Section {
                Button(action: {
                    self.addBudget()
                }) {
                    Text("Add Budget")
                }
            }
            
            Section(header: Text("Budget List")) {
                List {
                    ForEach(manageBudget.budgets) { budget in
                        VStack(alignment: .leading) {
                            Text(budget.name)
                                .font(.headline)
                            Text("Category: \(budget.category)")
                                .font(.subheadline)
                            Text("Amount: \(budget.amount)")
                                .font(.subheadline)
                            Text("Date: \(budget.date)")
                                .font(.subheadline)
                        }
                        .contextMenu{
                            Button(action: {
                                manageBudget.removeBudget(withID: budget.id)
                            })
                            {
                                Label("Delete", systemImage: "list.dash")
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Manage Budget")
    }

    func addBudget() {
        guard let amountValue = Double(amount) else { return }
        let budget = Budget(name: name, category: category, amount: amountValue, date: selectedDate)
        manageBudget.addBudget(budget: budget)
        dismissView()
    }

    func dismissView() {
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
