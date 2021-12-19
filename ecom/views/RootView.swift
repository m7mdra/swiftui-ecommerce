//
//  ContentView.swift
//  ecom
//
//  Created by mega on 18/11/2021.
//

import SwiftUI
import NavigationStack

struct RootView: View {
    
    @State var isLoading:Bool = false
    var body: some View {
        NavigationStackView{
            
       
            PortalView()
            
        }
        .onAppear {
            isLoading = true
            
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
                self.timerDone()
            }
            
        }
    }
    func timerDone(){
        isLoading = false
    }
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
