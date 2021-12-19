//
//  LoginView.swift
//  ecom
//
//  Created by mega on 18/12/2021.
//

import SwiftUI
import NavigationStack



struct PortalView: View {
    
    
    @State var currentSelection = 0
    var tabs = ["Sign up","Login","Forgot password"]
    @State  var index = 0
    @State var isShowingDetailView = false

    @EnvironmentObject private var navigationStack: NavigationStack
    var body: some View {

        Colors.windowBackground.swiftUiColor
            .ignoresSafeArea()
            .overlay(
                VStack{
                    SlidingTabView(selection: $currentSelection, tabs:tabs,onChange: { tab in
                        withAnimation {
                            self.index = tab
                        }
                    })
                        .padding(.top)
                    
                    if index == 2{
                        Text("Enter the email address you used to create your account and we will email you a link to reset your password")
                            .foregroundColor(Colors.raven.swiftUiColor)
                            .fontWeight(Font.Weight.light)
                            .padding()
                    }
                    VStack {
                        Form{
                            
                            UTextView(iconName: "ic_mail", label: index == 1 ? "Username/EMAIL" : "EMAIL")
                            
                            if index == 0{
                                
                                UTextView(iconName: "profile", label: "Username")
                            }
                            
                            
                            if index == 1 || index == 0{
                                UTextView(iconName: "lock", label: "Passowrd",secure: true)
                            }
                            
                            
                            
                        }.frame(height:formHeight(index))
               
                        
                        PrimaryButton(title: actionTitle(currentSelection)) {
                            
                            navigationStack.push(MainView())
                        }.padding()
                        
                        Text(bottomHelperText(index))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        
                        
                    }
                    Spacer()
                    
                    
                }).gesture(DragGesture(minimumDistance: 40, coordinateSpace: .local)
                            .onEnded({ value in
                    if value.startLocation.x > value.location.x {
                        if index == 2 {
                            return
                        }
                    
                        withAnimation {
                            currentSelection+=1
                            index+=1
                        }
                        
                    } else {
                
                        if index==0 {
                            return
                        }
                        withAnimation {
                            index-=1
                            currentSelection-=1
                        }
                    }
                 
                    NotificationCenter.default.post(name: NSNotification.Name("updateScroll"), object: nil)
       
                }))
        
    }
    private func actionTitle(_ currentSelection:Int) -> String  {
        if (currentSelection == 0){
            return "SIGN UP"
        }else if (currentSelection==1){
            return "Log in"
        }else{
            return "SEND EMAIL"
        }
    }
    private func formHeight(_ currentSelection:Int) -> CGFloat  {
        if (currentSelection == 0){
            return 250
        }else if (currentSelection==1){
            return 180
        }else{
            return 110
        }
    }
    private func bottomHelperText(_ currentSelection:Int) -> NSMutableAttributedString  {
        if (currentSelection == 0){
            return termsAndPrivacy()
        }else if (currentSelection==1){
            return createAccountText()
        }else{
            return NSMutableAttributedString()
        }
    }
    
    private func termsAndPrivacy()->NSMutableAttributedString{
        let attributedString =   NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: "By creating an account, you agree to our ",attributes:[.foregroundColor: Colors.raven]))
        attributedString.append(NSAttributedString(string: "Terms of Service ",attributes:[.foregroundColor: Colors.accent]))
        attributedString.append(NSAttributedString(string: "And ",attributes:[.foregroundColor: Colors.raven]))
        attributedString.append(NSAttributedString(string: "Privacy Policy",attributes:[.foregroundColor: Colors.accent]))
        return attributedString
    }
    private func createAccountText()->NSMutableAttributedString{
        let attributedString =   NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: "Don’t have an account? Swipe right to     \n",attributes:[.foregroundColor: Colors.raven]))
        attributedString.append(NSAttributedString(string: "create a new account.",attributes:[.foregroundColor: Colors.accent]))
        
        return attributedString
    }
}

struct PortalView_Previews: PreviewProvider {
    static var previews: some View {
        PortalView()
    }
}

