//
//  AddTask.swift
//  todo-list
//
//  Created by Aral Muftuoglu
//

// new view to add task

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.presentationMode) var present
    @EnvironmentObject var taskList : TaskList
    @State var newTask: String = ""
    

    var body: some View {
        
    
        VStack {
            Text("This is the first step of productivity!").multilineTextAlignment(.center).font(.largeTitle)
            
            TextField("Enter your new task", text: $newTask).textFieldStyle(.roundedBorder).padding(.all)
            
            Button(action: {
                
                taskList.add(taskName: newTask)
                present.wrappedValue.dismiss()
                
                }, label: {
                
                HStack {
                    Image(systemName: "plus")
                    Text("Add")
                }.padding().foregroundColor(.white).background(Color.green).cornerRadius(30)
            })
            
            
            Spacer()
        }
        
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            AddTaskView()
        }.environmentObject(TaskList())
    }
}
