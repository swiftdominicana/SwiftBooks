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
  Book(name:"Clean Code", imageName: "clean-code"),
  Book(name: "Swift UI", imageName: "swiftUI"),
  Book(name:"Auto Layout", imageName: "auto-layout"),
  Book(name:"Clean Code", imageName: "clean-code"),
  Book(name: "Swift UI", imageName: "swiftUI"),
  Book(name:"Auto Layout", imageName: "auto-layout"),
  Book(name:"Clean Code", imageName: "clean-code"),
  Book(name: "Swift UI", imageName: "swiftUI"),
  Book(name:"Auto Layout", imageName: "auto-layout"),
  Book(name:"Clean Code", imageName: "clean-code")
]

let topBooks = [
  Book(name:"Auto Layout", imageName: "auto-layout"),
  Book(name:"Clean Code", imageName: "clean-code"),
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
  var body: some View {
    VStack {
      ScrollView(.horizontal) {
        HStack(spacing: 10) {
          ForEach(topBooks) { book in
            NavigationLink(destination: BookDetailView(book: book)) {
              Image(book.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(20.0)
                .padding([.leading, .trailing], 5)
            }
          }
        }
        .padding([.top, .bottom] , 20)
      }
      ScrollView {
        ForEach(books) { book in
          NavigationLink(destination: BookDetailView(book: book)) {
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
          }
        }
      }
    }
    .padding(20)
    .edgesIgnoringSafeArea(.bottom)
    .navigationTitle("My Books")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ContentView()
    }
  }
}
