//
//  TabView.swift
//  Animal
//
//  Created by Duy Ha on 19/10/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ForEach(BottomTabBar.allCases) { tab in
                tab.destination
                    .tabItem { tab.label }
            }
        } //: Tab
    }
}

#Preview {
    MainTabView()
}
