//
//  HomeView.swift
//  ecom
//
//  Created by mega on 19/12/2021.
//

import SwiftUI

struct MainView: View {
    @State var selection = 0
    var body: some View {
        
        TabView(selection:$selection){
            Colors.windowBackground.swiftUiColor
                .ignoresSafeArea()
                .overlay(
            Text("Home"))
            
                .tag(0)
                .tabItem {
                    Label("Home", image:selection == 0 ? "home_active":"home")
                }
            Text("Search")
                .tag(1)

                .tabItem {
                    
                    Label("Search", image:selection == 1 ? "search_active":"search")
                }
            Text("Cart")
                .tag(2)

                .tabItem {
                    
                    Label("Cart", image:selection == 2 ? "cart_active":"cart")
                }
            Text("Profile")
                .tag(3)

                .tabItem {
                    
                    Label("Profile", image:selection == 3 ? "profile_active":"profile")
                }
            Text("More")
                .tag(4)

                .tabItem {
                    
                    Label("More", image:selection == 4 ? "more_active":"more")
                }

        }
        
        .accentColor(Colors.accent.swiftUiColor)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
