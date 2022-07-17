//
//  Task.swift
//  todo-list
//
//  Created by Aral Muftuoglu on 7/15/22.
//

import Foundation


struct Task: Identifiable
{
    let id = UUID()
    let taskName: String
    let isDone: Bool
}

class TaskList : ObservableObject {
    
    @Published var tasks : [Task] = []
    
    
    func add(taskName: String) {
        let newTask = Task(taskName: taskName, isDone: false)
        tasks.append(newTask)
    }
    
    func delete(set: IndexSet)
    {
        tasks.remove(atOffsets: set)
    }
    
    func move(indices: IndexSet, newOffset: Int)
    {
        tasks.move(fromOffsets: indices, toOffset: newOffset)
    }
}
