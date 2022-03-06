//
//  TodoListApp.swift
//  TodoList
//
//  Created by Bi on 06/03/2022.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
