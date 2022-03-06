//
//  ItemModel.swift
//  TodoList
//
//  Created by Bi on 06/03/2022.
//

import Foundation
import SwiftUI

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    let priority: Priority
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, priority: Priority) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.priority = priority
    }
    
    func updateItem() -> ItemModel {
        return ItemModel(title: title, isCompleted: !isCompleted, priority: priority)
    }
    
    func colorByStatus() -> Color {
        switch (priority, isCompleted) {
        case (.veryHigh, false):
            return .red
        case (.high, false):
            return .orange
        case (.normal, false):
            return .yellow
        case (.low, false):
            return .blue
        case (.veryLow, false):
            return .purple
        default:
            return .green
        }
    }
}

enum Priority: Int, Codable, CaseIterable {
    case veryHigh = 5
    case high = 4
    case normal = 3
    case low = 2
    case veryLow = 1
    
    var description: String {
        switch self {
        case .veryHigh:
            return "5"
        case .high:
            return "4"
        case .normal:
            return "3"
        case .low:
            return "2"
        case .veryLow:
            return "1"
        }
    }
}
