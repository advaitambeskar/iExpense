//
//  ContentView.swift
//  iExpense
//
//  Created by Advait Ambeskar on 13/11/21.
//

import SwiftUI
import CoreData



struct ContentView: View {
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack {
                            Text(item.name)
                                .bold()
                            Text(String(item.type))
                        }
                        .padding()
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar() {
                Button {
                showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().body
    }
}
