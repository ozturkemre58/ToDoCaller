import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemsView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                self.viewModel.deleteToDo(item.id)
                            }
                        }.tint(.red)
                }
                .listStyle(PlainListStyle())
                .padding()
                .navigationTitle("ToDos")
                .toolbar {
                    Button {
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewModel.showingNewItemView, content: {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                })
            }
        }
    }
}

#Preview {
    ToDoListView(userId:  "")
}
