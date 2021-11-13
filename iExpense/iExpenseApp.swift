//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Advait Ambeskar on 13/11/21.
//

import SwiftUI

@main
struct iExpenseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
