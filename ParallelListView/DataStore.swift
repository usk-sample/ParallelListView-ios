//
//  DataStore.swift
//  ParallelListView
//
//  Created by Yusuke Hasegawa on 2023/12/02.
//

import Foundation

class DataStore: ObservableObject {
    
    var data: [String: [Item]] = [:]
        
    func getData(id: String) -> [Item] {
        if let items = data[id] {
            return items
        } else {
            
            let items: [Item] = [
                .item(title: "task 1"),
                .item(title: "task 2"),
                .item(title: "task 3")
            ]
            
            data[id] = items
            
            return items
        }
    }
    
}
