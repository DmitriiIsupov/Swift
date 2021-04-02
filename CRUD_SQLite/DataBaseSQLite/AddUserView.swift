//
//  AddUserView.swift
//  CRUD_SQLite
//
//  Created by Dmitrii Isupov on 25.03.2021.
//

import SwiftUI

struct AddUserView: View {

    // create variables to store user input values
    @State var name: String = ""
    @State var email: String = ""
    @State var phoneNumber: String = ""
    @State var photouser: String = ""
    
    // to go back on the home screen when the user is added
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        Image("Contact")
            .resizable()
            .frame(width: 200, height: 200)
            .cornerRadius(100)
        VStack {
            // create name field
            TextField("Enter name", text: $name)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .disableAutocorrection(true)
             
            // create email field
            TextField("Enter email", text: $email)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
             //create phone
            TextField("Enter number", text: $phoneNumber)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            // button to add a user
            Button(action: {
                // call function to add row in sqlite database
                DB_Manager().addUser(nameValue: self.name, emailValue: self.email,phoneNumberValue: self.phoneNumber, photoUserValue: self.photouser)
                 
                // go back to home page
                self.mode.wrappedValue.dismiss()
            }, label: {
                Text("Add User")
            })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top, 10)
                .padding(.bottom, 10)
        }.padding()
    }
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView()
    }
}
