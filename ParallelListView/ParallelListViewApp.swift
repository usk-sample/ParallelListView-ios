//
//  ParallelListViewApp.swift
//  ParallelListView
//
//  Created by Yusuke Hasegawa on 2023/12/02.
//

import SwiftUI

@main
struct ParallelListViewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataStore())
        }
    }
}
