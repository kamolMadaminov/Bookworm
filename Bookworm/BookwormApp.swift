//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Kamol Madaminov on 03/04/25.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
