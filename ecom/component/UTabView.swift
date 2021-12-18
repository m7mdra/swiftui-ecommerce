//
//  Tabs.swift
//  ProjectOne
//
//  Created by Sharif on 05/03/2021.
//  Copyright © 2021 Sharif. All rights reserved.
//

import Foundation

import SwiftUI

@available(iOS 13.0, *)
public struct SlidingTabView : View {
    
    // MARK: Internal State
    
    /// Internal state to keep track of the selection index
    @State private var selectionState: Int = 0 {
        didSet {
            print("selection: \(selection) \(selectionState)")
            selection = selectionState
        }
    }
    
    // MARK: Required Properties
    
    /// Binding the selection index which will  re-render the consuming view
    @Binding var selection: Int

    /// The title of the tabs
    let tabs: [String]
    
    // Mark: View Customization Properties
    
    /// The font of the tab title
    let font: Font
    
    /// The selection bar sliding animation type
    let animation: Animation
    
    /// The accent color when the tab is selected
    let activeAccentColor: Color
    
    /// The accent color when the tab is not selected
    let inactiveAccentColor: Color
    
    /// The color of the selection bar
    let selectionBarColor: Color
    
    /// The tab color when the tab is not selected
    let inactiveTabColor: Color
    
    /// The tab color when the tab is  selected
    let activeTabColor: Color
    
    /// The height of the selection bar
    let selectionBarHeight: CGFloat
    
    /// The selection bar background color
    let selectionBarBackgroundColor: Color
    
    /// The height of the selection bar background
    let selectionBarBackgroundHeight: CGFloat
    var onChange:(Int)->Void = {_ in }

    // MARK: init
    
    public init(selection: Binding<Int>,
                tabs: [String],
                font: Font = .body,
                animation: Animation = .spring(),
                activeAccentColor: Color = .black,
                inactiveAccentColor: Color = .black,
                selectionBarColor: Color = .black,
                inactiveTabColor: Color = .clear,
                activeTabColor: Color = .clear,
                selectionBarHeight: CGFloat = 2,
                selectionBarBackgroundColor: Color = Color.gray.opacity(0.2),
                selectionBarBackgroundHeight: CGFloat = 1,onChange:@escaping (Int)->Void = {_ in}) {
        assert(tabs.count > 1, "Must have at least 2 tabs")
        
        self._selection = selection
        self.tabs = tabs
        self.onChange = onChange
        self.font = font
        self.animation = animation
        self.activeAccentColor = activeAccentColor
        self.inactiveAccentColor = inactiveAccentColor
        self.selectionBarColor = selectionBarColor
        self.inactiveTabColor = inactiveTabColor
        self.activeTabColor = activeTabColor
        self.selectionBarHeight = selectionBarHeight
        self.selectionBarBackgroundColor = selectionBarBackgroundColor
        self.selectionBarBackgroundHeight = selectionBarBackgroundHeight
    }
    
    
    private func tabId(tab:String)->Int {
        
        return self.tabs.firstIndex(of: tab) ?? 0
    }
    let pub = NotificationCenter.default
            .publisher(for: NSNotification.Name("updateScroll"))


    public var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            ScrollViewReader{ value in

                HStack{

                    ForEach(self.tabs, id:\.self) { tab in
                        Button(action: {
                            
                            let selection = tabId(tab: tab)
                            if self.selection != selection{
                                self.onChange(selection)

                                withAnimation {
                                    value.scrollTo(selection,anchor: .center)
                                }
                                self.selectionState = selection
                            }
                            
                        }) {
                            Text(tab)
                                .font(.system(size: 33))
                                .bold()
                        }
                        .id(tabId(tab: tab))
                        .padding(.horizontal,10)
                        .accentColor(
                            self.isSelected(tabIdentifier: tab)
                            ? Colors.raven.swiftUiColor
                            : Colors.raven.withAlphaComponent(0.3).swiftUiColor)
                        .background(
                            self.isSelected(tabIdentifier: tab)
                            ? self.activeTabColor
                            : self.inactiveTabColor)
                    }
                    
                }.onReceive(pub) { (output) in
                    withAnimation {
                        value.scrollTo(selection,anchor: .center)
                    }
                }

                
            }
        }
        
        
        
    }
    
    // MARK: Private Helper
    
    private func isSelected(tabIdentifier: String) -> Bool {
        return selection == tabId(tab: tabIdentifier)
    }
    

}

#if DEBUG

@available(iOS 13.0, *)
struct SlidingTabConsumerView : View {
    @State private var selectedTabIndex = 2
    
    var body: some View {
        VStack(alignment: .leading) {
            SlidingTabView(selection: self.$selectedTabIndex,
                           tabs: ["Sign Up","Login","Forgot Password","Sign Up1","Login2","Forgot Password3"],
                           font: .body,
                           activeAccentColor: Color.blue,
                           selectionBarColor: Color.blue)
            (selectedTabIndex == 0 ? Text("First View") : Text("Second View")).padding()
            Spacer()
        }
        .padding(.top, 50)
        
    }
}

@available(iOS 13.0.0, *)
struct SlidingTabView_Previews : PreviewProvider {
    static var previews: some View {
        SlidingTabConsumerView()
    }
}
#endif
