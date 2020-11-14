//
//  ContentView.swift
//  SwiftBooks
//
//  Created by Libranner Leonel Santos Espinal on 14/11/2020.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    List {
      ForEach(0..<5) { _ in
        NavigationLink(
          destination: BookDetailView(book: "Book name")) {
          HStack {
            Image("swiftUI")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 100, height: 100)

            Text("Book Name")
          }
        }
      }
    }
    .navigationTitle(Text("String"))
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct BookDetailView: View {
  let book: String
  var body: some View {
    Text(book)
      .foregroundColor(.green)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ContentView()
    }
  }
}
