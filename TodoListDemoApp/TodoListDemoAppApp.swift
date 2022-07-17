//
//  todo_listApp.swift
//  todo-list
//
//  Created by Aral Muftuoglu on 7/12/22.
//

import SwiftUI

@main
struct todo_listApp: App {
    
    @StateObject var taskList : TaskList = TaskList()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(taskList)
            
        }
    }
}
