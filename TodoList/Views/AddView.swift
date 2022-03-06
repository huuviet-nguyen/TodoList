//
//  AddView.swift
//  TodoList
//
//  Created by Bi on 06/03/2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State var priority: Priority = .veryLow
    var body: some View {
        ScrollView {
            VStack {
                Text("Content")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                .cornerRadius(10)
                
                Text("Priority")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Picker("", selection: $priority) {
                    ForEach(Priority.allCases, id: \.self) {
                        Text($0.description)
                    }
                }
                .pickerStyle(.segmented)
                
                Button {
                    if textIsAppropriate() {
                        listViewModel.addItem(title: textFieldText, priority: priority)
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(14)
        }
        .navigationTitle("Add an Item ✎")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo is too short!!!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
