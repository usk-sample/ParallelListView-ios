//
//  ListViewModel.swift
//  ParallelListView
//
//  Created by Yusuke Hasegawa on 2023/12/02.
//

import SwiftUI

struct Item: Identifiable {
    var id: String
    var title: String
    
    static func item(title: String) -> Item {
        return .init(id: UUID().uuidString, title: title)
    }
    
}

class ListViewModel: ObservableObject, Hashable, Identifiable {
    
    var id: String
    
    init(id: String = UUID().uuidString) {
        self.id = id
    }
        
    @Published var items: [Item] = []
    
    var dataStore: DataStore!
    
    func loadItems(store: DataStore) {
        
        self.dataStore = store

        items = dataStore.getData(id: id)
        
    }
    
    func addItem(title: String) {
        
        let newItem = Item.item(title: title)
        items.append(newItem)
        dataStore.data[id]?.append(newItem)
        
    }
    
}

extension ListViewModel {
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    static func == (lhs: ListViewModel, rhs: ListViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
