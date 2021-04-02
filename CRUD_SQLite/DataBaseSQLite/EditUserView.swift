//
//  EditUserView.swift
//  CRUD_SQLite
//
//  Created by Dmitrii Isupov on 25.03.2021.
//

import SwiftUI

struct EditUserView: View {

    // id receiving of user from previous view
    @Binding var id: Int64
     
    // variables to store value from input fields
    @State var name: String = ""
    @State var email: String = ""
    @State var phoneNumber: String = ""
    @State var photoUser: String = ""
     
    // to go back to previous view
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
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
            
            TextField("Enter number", text: $phoneNumber)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
             
            // create age field, number pad
          
            // button to update user
            Button(action: {
                // call function to update row in sqlite database
                DB_Manager().updateUser(idValue: self.id, nameValue: self.name, emailValue: self.email, phoneNumberValue: self.phoneNumber, photoUserValue: self.photoUser )
 
                // go back to home page
                self.mode.wrappedValue.dismiss()
            }, label: {
                Text("Edit User")
            })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top, 10)
                .padding(.bottom, 10)
        }.padding()
 
        // populate user's data in fields when view loaded
        .onAppear(perform: {
             
            // get data from database
            let userModel: UserModel = DB_Manager().getUser(idValue: self.id)
             
            // populate in text fields
            self.name = userModel.name
            self.email = userModel.email
            self.phoneNumber = userModel.phoneNumber
            self.photoUser = userModel.photoUser
        })
    }
}

struct EditUserView_Previews: PreviewProvider {

    // when using @Binding, do this in preview provider
    @State static var id: Int64 = 0

    static var previews: some View {
        EditUserView(id: $id)
    }
}
