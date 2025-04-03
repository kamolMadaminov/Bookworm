//
//  ContentView.swift
//  Bookworm
//
//  Created by Kamol Madaminov on 03/04/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack{
            List(students){ student in
                    Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add"){
                    let firstNames = ["Kamol", "Nilufar", "Sultan", "Nilufar", "Sultan"]
                    let lastNames = ["Madaminov", "Zakirova", "Khuslenov", "Zakirova", "Khuslenov"]
                    
                    let chosenFirstName = firstNames.randomElement() ?? "Unknown"
                    let chosenLastName = lastNames.randomElement() ?? "Unknown"
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
