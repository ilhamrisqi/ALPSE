//
//  ManageBudget.swift
//  ALPSE
//
//  Created by ilham risqi on 15/05/23.
//

import Foundation
import SwiftUI

struct Budget: Identifiable, Codable {
    let id = UUID()
    let name: String
    let category: String
    let amount: Double
    let date: Date
}

class ManageBudget: ObservableObject {
    @Published var budgets: [Budget] = []

    init() {
        loadBudgets()
    }

    // Fungsi untuk menambah anggaran ke daftar dan menyimpannya
    func addBudget(budget: Budget) {
        budgets.append(budget)
        saveBudgets()
    }
    
    //Fungsi untuk menghapus anggaran yang ada di daftar
    func removeBudget(withID id: UUID) {
        budgets.removeAll { $0.id == id }
        saveBudgets()
    }


    // Fungsi untuk menyimpan daftar anggaran menggunakan UserDefaults
    func saveBudgets() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(budgets)
            UserDefaults.standard.set(data, forKey: "budgets")
        } catch {
            print("Gagal menyimpan anggaran.")
        }
    }

    // Fungsi untuk memuat daftar anggaran dari UserDefaults
    func loadBudgets() {
        if let data = UserDefaults.standard.data(forKey: "budgets") {
            do {
                let decoder = JSONDecoder()
                budgets = try decoder.decode([Budget].self, from: data)
            } catch {
                print("Gagal memuat anggaran.")
            }
        }
    }
    
    //Fungsi untuk menampilkan data anggaran
    func showManageBudgetView() {
        let manageBudgetView = ManageBudgetView(manageBudget: self)
        let navigationController = UINavigationController(rootViewController: UIHostingController(rootView: manageBudgetView))
        UIApplication.shared.windows.first?.rootViewController?.present(navigationController, animated: true, completion: nil)
    }
}
