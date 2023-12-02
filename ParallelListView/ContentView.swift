//
//  ContentView.swift
//  ParallelListView
//
//  Created by Yusuke Hasegawa on 2023/12/02.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = 0
    
    @State var listViewModels: [ListViewModel] = [
        ListViewModel(),
        ListViewModel(),
        ListViewModel()
    ]
    
    var body: some View {
        VStack {
            
            TabView(selection: $selectedTab) {
                ForEach(Array(listViewModels.enumerated()), id: \.element) { index, viewModel in
                    
                    ListView(viewModel: viewModel)
                        .tag(index)
                }
            }
            .tabViewStyle(.page)
            
            HStack {
                Button("add new task") {
                    debugPrint("current: \(selectedTab)")
                    
                    listViewModels[selectedTab].addItem(title: "new task")
                    
                }
                Spacer()
            }.padding()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(DataStore())
}
