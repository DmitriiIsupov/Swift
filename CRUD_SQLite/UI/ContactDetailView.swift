//
//  ContactDetailView.swift
//  CRUD_SQLite
//
//  Created by Dmitrii Isupov on 25.03.2021.
//

import SwiftUI

struct ContactDetailView : View {
    @State var userModels: [UserModel] = []
    
    // check if user is selected for edit
    @State var userSelected: Bool = false
    
    // id of selected user to edit or delete
    @State var selectedUserId: Int64 = 0
   // @EnvironmentObject var userData: UserData
    var usermodel: UserModel


    var body: some View {
        
        //let model: usermodel
        VStack {
            Image(/*usermodel.photoUser*/"Contact")
                .resizable()
                .clipShape(Circle())
                .frame(width: 200, height: 200)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            Spacer()
            HStack {
                Text("\(usermodel.name)")
                    .font(.largeTitle)
            }
            
            HStack {
                Text("Phone")
                Spacer()
                Text(usermodel.phoneNumber)
                    .foregroundColor(Color.blue)
                }.padding(.bottom, 5)
            
            HStack {
                Text("Email")
                Spacer()
                Text(usermodel.email)
                }.padding(.bottom, 5)
            
            HStack {
                Text("Address")
                Spacer()

            }.padding(.bottom, 5)
            
            Spacer()
           HStack{
                Spacer()
                Button(action: {
                //self.selectedUserId = model.id
                self.userSelected = true
                }, label: {
                Text("Edit")
                .foregroundColor(Color.blue)
                })
                // by default, buttons are full width.
                // to prevent this, use the following
                .buttonStyle(PlainButtonStyle())
                Spacer()
                // button to delete user
                Button(action: {
                
                // create db manager instance
                let dbManager: DB_Manager = DB_Manager()
                
                // call delete function
               // dbManager.deleteUser(idValue: model.id)
                
                // refresh the user models array
                self.userModels = dbManager.getUsers()
                }, label: {
                Text("Delete")
                .foregroundColor(Color.red)
                })// by default, buttons are full width.
                // to prevent this, use the following
                .buttonStyle(PlainButtonStyle())
                Spacer()
            }
        }.padding(40)
    }
}

