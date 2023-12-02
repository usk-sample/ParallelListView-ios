//
//  ListView.swift
//  ParallelListView
//
//  Created by Yusuke Hasegawa on 2023/12/02.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var viewModel = ListViewModel()
    @EnvironmentObject var dataStore: DataStore
    
    var body: some View {
        List {
            ForEach($viewModel.items) { item in
                Text(item.title.wrappedValue)
            }
        }.onAppear {
            self.viewModel.loadItems(store: dataStore)
        }
    }
}

#Preview {
    ListView()
        .environmentObject(DataStore())
}
