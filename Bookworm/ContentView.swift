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
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(books){ book in
                    NavigationLink(value: book){
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading){
                                Text(book.title)
                                    .font(.headline)
                                    .foregroundColor(book.rating == 1 ? .red : .primary)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBook)
            }
                .navigationTitle("Bookworm")
                .navigationDestination(for: Book.self){ book in
                    DetailView(book: book)
                }
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Add book", systemImage: "plus"){
                            showingAddScreen.toggle()
                        }
                    }
                    
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
    }
    
    func deleteBook(at offsets: IndexSet) {
        for offset in offsets{
            let bookToDelete = books[offset]
            modelContext.delete(bookToDelete)
        }
    }
}

#Preview {
    ContentView()
}
