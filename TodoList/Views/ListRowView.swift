//
//  ListRowView.swift
//  TodoList
//
//  Created by Bi on 06/03/2022.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle": "circle")
                .foregroundColor(item.colorByStatus())
            Text(item.title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        let item = ItemModel(title: "This is the first title!", isCompleted: false, priority: .veryLow)
        ListRowView(item: item)
    }
}
