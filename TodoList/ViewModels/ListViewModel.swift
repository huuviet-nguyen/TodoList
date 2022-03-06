//
//  ItemViewModel.swift
//  TodoList
//
//  Created by Bi on 06/03/2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        items = sortItems(items: savedItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String, priority: Priority) {
        let item = ItemModel(title: title, isCompleted: false, priority: priority)
        items.append(item)
        items = sortItems(items: items)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex (where: {$0.id == item.id} ) {
            items[index] = item.updateItem()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    func sortItems(items: [ItemModel]) -> [ItemModel] {
        return items.sorted(by: { $0.priority.rawValue > $1.priority.rawValue })
    }
}
