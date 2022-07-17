//
//  ListView.swift
//  todo-list
//
//  Created by Aral Muftuoglu
//

import Foundation
import SwiftUI


// making the list row objects with check mark clicking

struct ListRowView: View {
    
    let listElement: Task
    
    @State var checked: Bool
    
    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.square.fill" : "square").foregroundColor(checked ? Color(UIColor.systemGreen) : Color.secondary).onTapGesture {
                self.checked.toggle()
            }
            Text(listElement.taskName)
            Spacer()
        }
    }
}

struct ContentView: View {
    
    @EnvironmentObject var taskList : TaskList
    
    var body: some View {
        
            List {
                
                ForEach(taskList.tasks)
                {
                    task in ListRowView(listElement: task, checked: false)
                }
                .onDelete(perform: taskList.delete)
                .onMove(perform: taskList.move)
                 
                }.listStyle(GroupedListStyle())
                
            .navigationTitle("To-Do List")
                .navigationBarTitleDisplayMode(.automatic)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: NavigationLink(destination: AddTaskView(), label: {
                        Image(systemName: "plus")
                    }))
    }

}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        NavigationView
        {
            ContentView()
        }
        .environmentObject(TaskList())
    }
}
