//
//  DishItem.swift
//  ioscapstone
//
//  Created by Tan Xin Jie on 3/12/24.
//

import SwiftUI

struct DishDetail: View {
    let dish: Dish

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: URL(string: dish.image ?? "")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                } else if phase.error != nil {
                    Color.red.frame(maxWidth: .infinity, maxHeight: 200)
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                }
            }

            Text(dish.title ?? "Unknown Dish")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("$\(dish.price ?? "0.00")")
                .font(.title2)
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
        .navigationTitle(dish.title ?? "Dish Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let previewContext = PersistenceController.shared.container.viewContext
    let placeholderDish = Dish(context: previewContext)
       placeholderDish.title = "Sample Dish"
       placeholderDish.price = "15.99"
       placeholderDish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true"
    return DishDetail(dish: placeholderDish)
}
