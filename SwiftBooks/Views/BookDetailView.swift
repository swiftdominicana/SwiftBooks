//
//  BookDetailView.swift
//  SwiftBooks
//
//  Created by Libranner Leonel Santos Espinal on 14/11/2020.
//

import SwiftUI

struct BookDetailView: View {
  let book: Book

  var body: some View {
    VStack {
      Spacer()
      Image(book.imageName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
      Text(book.name)
        .font(.title)
        .foregroundColor(.green)
      Text("Here goes the description")
        .font(.body)
      Spacer()
    }
    .padding(30.0)
    .navigationTitle(book.name)
  }
}

struct BookDetailView_Previews: PreviewProvider {
  static var previews: some View {
    BookDetailView(book: Book(name: "Test", imageName: "swiftUI"))
  }
}
