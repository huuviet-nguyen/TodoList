//
//  ItemModel.swift
//  TodoList
//
//  Created by Bi on 06/03/2022.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateItem() -> ItemModel {
        return ItemModel(title: title, isCompleted: !isCompleted)
    }
}
