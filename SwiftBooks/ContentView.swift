//
//  ContentView.swift
//  SwiftBooks
//
//  Created by Libranner Leonel Santos Espinal on 14/11/2020.
//

import SwiftUI

let books = [
  Book(name: "Swift UI", imageName: "swiftUI"),
  Book(name:"Auto Layout", imageName: "auto-layout"),
  Book(name:"Clean Code", imageName: "clean-code")
]

struct Book: Identifiable {
  var id = UUID()
  let name: String
  let imageName: String
}

struct ContentView: View {
  @State var isPresented = false
  @State var selectedBook: Book?

  var body: some View {
    List(books) { book in
      HStack {
        Image(book.imageName)
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
    if book == nil {
      Text("Book Not Available")
    }
    else {
      VStack {
        Spacer()
        Image(book!.imageName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        Text(book!.name)
          .font(.title)
          .foregroundColor(.green)
        Text("Here goes the descriptio")
          .font(.body)
        Spacer()
      }.padding(30.0)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
