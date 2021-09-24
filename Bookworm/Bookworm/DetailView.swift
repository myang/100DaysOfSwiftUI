//
//  DetailView.swift
//  DetailView
//
//  Created by Eric Yang on 24.9.2021.
//

import SwiftUI
import CoreData

struct DetailView: View {
    let book: Book
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test Book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This is a great book, I really enjoy it"
        
        return NavigationView {
            DetailView(book: book)
        }
    }
}
