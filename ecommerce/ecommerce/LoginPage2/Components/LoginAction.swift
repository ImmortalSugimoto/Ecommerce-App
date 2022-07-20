//
//  LoginAction.swift
//  ecommerce
//
//  Created by liban 

import SwiftUI

struct LoginAction: View {
    
    @Binding var email: String
    @Binding var password: String
    @State var showNextView = false
    @State var showAlerts = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
            }
            NavigationLink(destination: MainTabControllerSVC(idx: 0).navigationTitle("").navigationBarHidden(true), isActive: $showNextView) {
                EmptyView()
            }
            VStack(spacing: 10) {
                Button (action: {
                    showNextView = validate()
                }) {
                    Text("Continue")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .border(Color.green)
                }
                .foregroundColor(Color.white)
                .background(Color.green)
                .cornerRadius(15)
                GoToSignup()
            }
        }
        .padding([.top], 15)
        .alert(isPresented: $showAlerts){
            Alert(title: Text("Error"), message: Text("try entering correct password or create a new account"), dismissButton: .default(Text("Dismiss")))
        }
    }
    
    func validate() -> Bool {
        var result = false
        
        if checkInput(text: email) && checkInput(text: password){
            
            //check if user is registered
            if !CDUsersHelper.cdUsersHelper.isUserRegistered(email: email){
                print("please sign up first")
                showAlerts = true
            }else{
                //check if password is correct
                let correctpassword = CDUsersHelper.cdUsersHelper.getOne(email: email).password
                let uzer = CDUsersHelper.cdUsersHelper.getOne(email: email)
                if password == correctpassword{
                    print("you entered the correct password")
                    result = true
                    LoginPageViewModel.setUserDefaults(user: uzer)
                } else{
                    showAlerts = true
                    print(" please try entering the correct password")
                }
            }
        }
        else{
            print("please input username and password")
        }
        
        return result
    }
    
    func checkInput(text: String) -> Bool{
        var isValid = false
        if !text.isEmpty && text != "" && text != nil{
            isValid = true
        }
        return isValid
    }
    
}

