//
//  ContentView.swift
//  SwiftBooks
//
//  Created by Libranner Leonel Santos Espinal on 14/11/2020.
//

import SwiftUI

let books = [Book(name: "Swift UI"), Book(name:"Swift UI 2"), Book(name:"Swift UI 3")]

struct Book: Identifiable {
  var id = UUID()
  let name: String
}

struct ContentView: View {
  @State var isPresented = false
  @State var selectedBook: Book?

  var body: some View {
    List(books) { book in
      HStack {
        Image("swiftUI")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 100, height: 100)
          .cornerRadius(20.0)
        Text(book.name)
          .foregroundColor(.black)
        Spacer()
      }
      .padding()
      .background(Color.gray.opacity(0.3))
      .cornerRadius(20.0)
      .overlay(
        RoundedRectangle(cornerRadius: 20.0)
          .stroke(Color.gray)
      )
      .onTapGesture {
        selectedBook = book
        isPresented = true
      }
    }
    .sheet(isPresented: $isPresented) {
      BookDetailView(book: $selectedBook)
    }
  }
}

struct BookDetailView: View {
  @Binding var book: Book?
  var body: some View {
    Text(book?.name ?? "Book N/A")
      .foregroundColor(.green)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
