import SwiftUI

struct TaskListView :View{
    var sampleList = NTask.sampleTaskList
    @State private var showAddTaskView = false;
    @EnvironmentObject var taskList:TaskList
    
    var body: some View{
        
        ZStack(alignment:.bottom) {
            VStack{
                List{
                    ForEach(taskList.tasks){ nTask in
                        
                        ZStack {
                            
                            TaskView(task: nTask)
                                .listRowSeparator(.hidden)
                            
                            NavigationLink(destination:  TaskDetailView(task: nTask)) {
                                EmptyView()
                            }
                            
                            .opacity(0.0)
                            
                        }
                        .listRowSeparator(.hidden)
                        
                    

                    }
                    .onDelete { indexSet in
                        taskList.deleteTask(offset: indexSet)
                    }
                    
                }
                .listStyle(.plain)
                Spacer()
                ZStack(alignment:.leading) {
                    RoundedRectangle(cornerRadius: 8)
//                        .strokeBorder(.accent,lineWidth: 2)
                        .frame(height: 36)
                      .foregroundStyle(Color(.accent))
                    
                    Text("→ Your New Task!")
                        .padding(.horizontal)
                        .font(.callout)
                        .fontWeight(.semibold)
                }
                .padding()
                .onTapGesture {
                    withAnimation {
                        showAddTaskView = true
                    }
                    
                    
                }
                
            }
                        
            if(showAddTaskView){
                
                Color.black.opacity(0.01)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        showAddTaskView = false
                    }
                
                AddTaskView(isPresented:$showAddTaskView)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
                
                
            }
            
        }
        .animation(.easeInOut, value: showAddTaskView)
        .navigationTitle("Tasks")
        
    }
}




#Preview{
    NavigationView {
        TaskListView()
    }
}


