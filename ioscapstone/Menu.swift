//
//  Menu.swift
//  ioscapstone
//
//  Created by Tan Xin Jie on 3/12/24.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var searchText = ""
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Dish.title, ascending: true)],
        predicate: NSPredicate(value: true),
        animation: .default
    ) private var dishes: FetchedResults<Dish>
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode(MenuList.self, from: data)
                    print("Decoded menu: \(decoded.menu)")
                    for menuItem in decoded.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = menuItem.title
                        dish.image = menuItem.image
                        dish.price = menuItem.price
                        dish.desc = menuItem.description
                        dish.category = menuItem.category
                        
                        try? viewContext.save()
                    }
                } catch {
                    print("Failed to decode JSON: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
    
    var body: some View {
        FetchedObjects(predicate: buildPredicate()) { (dishes: [Dish]) in
            NavigationView {
                List {
                    VStack {
                        HStack {
                            Text("ORDER FOR DELIVERY!")
                                .font(.title3)
                            .fontWeight(.bold)
                            Spacer()
                        }
                        HStack {
                            Button("Starters") {}
                            Button("Mains") {}
                            Button("Desserts") {}
                            Button("Drinks") {}
                        }
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle)
                        .foregroundColor(Color.gray)
                    }
                    ForEach(dishes) { dish in
                        ZStack {
                            NavigationLink(destination: DishDetail(dish: dish)) {
                                EmptyView()
                            }
                            .opacity(0.0)
                            HStack {
                                VStack (alignment: .leading){
                                    Text("\(dish.title ?? "Unknown")")
                                        .font(.title3)
                                        .bold()
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                                    Text("\(dish.desc ?? "Unknown Description")")
                                        .font(.caption)
                                        .fontWeight(.light)
                                        .lineLimit(2)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                                    Text("$\(dish.price ?? "0.00")")
                                        .font(.headline)
                                }
                                
                                Spacer()
                                
                                AsyncImage(url: URL(string: dish.image ?? "")) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .aspectRatio(1, contentMode: .fill)
                                            .frame(width: 80, height: 80)
                                    } else if phase.error != nil {
                                        Color.red.frame(width: 80, height: 80)
                                    } else {
                                        ProgressView().frame(width: 80, height: 80)
                                    }
                                }
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .searchable(text: $searchText)
        }
        .onAppear{
            getMenuData()
        }
    }
}

#Preview {
    Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
