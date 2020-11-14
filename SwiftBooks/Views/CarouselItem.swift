//
//  CarouselItem.swift
//  SwiftBooks
//
//  Created by Libranner Leonel Santos Espinal on 14/11/2020.
//

import SwiftUI

struct CarouselItem: View {
  let book: Book

  var body: some View {
    Image(book.imageName)
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: 200, height: 200)
      .cornerRadius(15.0)
      .padding([.leading, .trailing], 5)
      .shadow(color: Color(.blue).opacity(0.3), radius: 5, x: 0, y: 10)
      .rotation3DEffect(.degrees(15.0), axis: (x: 1, y: 0, z: 0))
  }
}

struct CarouselItem_Previews: PreviewProvider {
  static var previews: some View {
    CarouselItem(book: Book(name: "Test", imageName: "swiftUI"))
  }
}
