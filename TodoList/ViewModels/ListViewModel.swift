//
//  ItemViewModel.swift
//  TodoList
//
//  Created by Bi on 06/03/2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems: [ItemModel] = [
            ItemModel(title: "This is the first title!", isCompleted: false),
            ItemModel(title: "This is the second title!", isCompleted: false),
            ItemModel(title: "This is the third title!", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let item = ItemModel(title: title, isCompleted: false)
        items.append(item)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex (where: {$0.id == item.id} ) {
            items[index] = item.updateItem()
        }
    }
}
