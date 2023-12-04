//
//  ContentView.swift
//  DragDrop
//
//  Created by Kranti on 2023/12/3.
//

import SwiftUI

struct DragNDrop: View {
    // State
    
    // lists
    @State var todoList: [String] = ["test1", "test2", "test3", "test4"]
    @State var doneList: [String] = ["done1"]
    
    // highlighting control
    @State var highlightTodoList: Bool = false
    @State var highlightDoneList: Bool = false
    
    var body: some View {
        HStack {
            Spacer()
            // Todo
            VStack {
                VStack {
                    Text("Todo")
                        .font(.title)
                    ForEach(todoList, id: \.self) { item in
                        Text(item)
                            .font(.title2)
                            .draggable(item)
                        
                    }
                }
                    .frame(height: 160)
                    .padding()
                    .background(Color(.systemGray))
                    .dropDestination(for: String.self) { droppedTasks, location in
                            
                        // shorthand for appending entire array into another array
                        let totalList = todoList + droppedTasks
                        
                        // make sure the items are unique using swift algorithms package
                        todoList = Array(totalList.uniqued())
                        
                        // remove contents of old array
                        for task in droppedTasks {
                            doneList.removeAll {$0 == task}
                        }
                        
                        return true
                    } isTargeted: { isTargetted in
                        highlightTodoList.toggle()
                    }
                        
                Spacer()
            }.padding(.trailing, 20)
            
            // Done
            VStack() {
                VStack {
                    Text("Done")
                        .font(.title)
                    ForEach(doneList, id: \.self) { item in
                        Text(item)
                            .font(.title2)
                            .draggable(item)
                        
                    }
                    Spacer()
                }
                    .frame(height: 160)
                    .padding()
                    .background(Color(.systemGray))
                    .dropDestination(for: String.self) { droppedTasks, location in
                            
                        // shorthand for appending entire array into another array
                        let totalList = doneList + droppedTasks
                        
                        // make sure the items are unique using swift algorithms package
                        doneList = Array(totalList)
                        
                        // remove contents of old array
                        for task in droppedTasks {
                            todoList.removeAll {$0 == task}
                        }
                        
                        return true
                    } isTargeted: { isTargetted in
                        highlightDoneList.toggle()
                    }
                Spacer()
            }
            Spacer()
            
        }.padding(.top, 50)
    }
}


#Preview {
    HomeView()
}
