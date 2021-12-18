//
//  LoginView.swift
//  ecom
//
//  Created by mega on 18/12/2021.
//

import SwiftUI



struct PortalView: View {
    
    
    @State var currentSelection = 0
    var tabs = ["Sign up","Login","Forgot password"]
    @State  var index = 0
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
        attributedString.append(NSAttributedString(string: "Don’t have an account? Swipe right to \n",attributes:[.foregroundColor: Colors.raven]))
        attributedString.append(NSAttributedString(string: "create a new account.",attributes:[.foregroundColor: Colors.accent]))
        
        return attributedString
    }
}

struct PortalView_Previews: PreviewProvider {
    static var previews: some View {
        PortalView()
    }
}

struct LoginView : View{
    var body: some View{
        VStack {
            Form{
                UTextView(iconName: "profile", label: "Username/Email")
                
                UTextView(iconName: "lock", label: "Passowrd",secure: true)
                
                
            }
            .frame(height:180)
            PrimaryButton(title: "LOG IN") {
                
            }.padding()
            
            Spacer()
            
        }
    }
}

struct SignupView : View{
    var body: some View{
        VStack {
            Form{
                UTextView(iconName: "profile", label: "Username")
                UTextView(iconName: "ic_mail", label: "Email")
                UTextView(iconName: "lock", label: "Passowrd",secure: true)
                
                
            }
            .frame(height:230)
            PrimaryButton(title: "Sign up") {
                
            }.padding()
            
            Spacer()
            
        }
    }
}

extension Text {
    init(_ astring: NSAttributedString) {
        self.init("")
        
        astring.enumerateAttributes(in: NSRange(location: 0, length: astring.length), options: []) { (attrs, range, _) in
            
            var t = Text(astring.attributedSubstring(from: range).string)
            
            if let color = attrs[NSAttributedString.Key.foregroundColor] as? UIColor {
                t  = t.foregroundColor(Color(color))
            }
            
            if let font = attrs[NSAttributedString.Key.font] as? UIFont {
                t  = t.font(.init(font))
            }
            
            if let kern = attrs[NSAttributedString.Key.kern] as? CGFloat {
                t  = t.kerning(kern)
            }
            
            
            if let striked = attrs[NSAttributedString.Key.strikethroughStyle] as? NSNumber, striked != 0 {
                if let strikeColor = (attrs[NSAttributedString.Key.strikethroughColor] as? UIColor) {
                    t = t.strikethrough(true, color: Color(strikeColor))
                } else {
                    t = t.strikethrough(true)
                }
            }
            
            if let baseline = attrs[NSAttributedString.Key.baselineOffset] as? NSNumber {
                t = t.baselineOffset(CGFloat(baseline.floatValue))
            }
            
            if let underline = attrs[NSAttributedString.Key.underlineStyle] as? NSNumber, underline != 0 {
                if let underlineColor = (attrs[NSAttributedString.Key.underlineColor] as? UIColor) {
                    t = t.underline(true, color: Color(underlineColor))
                } else {
                    t = t.underline(true)
                }
            }
            
            self = self + t
            
        }
    }
}
