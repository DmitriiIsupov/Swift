//
//  ContentView.swift
//  CRUD_SQLite
//
//  Created by Dmitrii Isupov on 25.03.2021.
//

 
import SwiftUI

struct ContentView: View {
    
    // array of user models
    @State var userModels: [UserModel] = []
    
    // check if user is selected for edit
    @State var userSelected: Bool = false
    
    // id of selected user to edit or delete
    @State var selectedUserId: Int64 = 0
    
    
    var body: some View {
        
        // create navigation view
        NavigationView {
            VStack {
                // create link to add user
                HStack {
                    Spacer()
                    NavigationLink (destination: AddUserView(), label: {
                        Text("Add agents")
                    })
                }
                
                // navigation link to go to edit user view
                NavigationLink (destination: EditUserView(id: self.$selectedUserId), isActive: self.$userSelected) {
                    EmptyView()
                }
                
                // list view goes here
                // create list view to show all users
                List (self.userModels) { (model) in
                    ContactList(model: model)
            }
            }.padding()
            .navigationBarTitle(Text("ContrAgents"),displayMode: .inline)
            // load data in user models array
            .onAppear(perform: {
                self.userModels = DB_Manager().getUsers()
            })
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




struct ContactList: View {
    let model: UserModel
    @State var selectedUserId: Int64 = 0
    @State var userSelected: Bool = false
    @State var userModels: [UserModel] = []
    var body: some View {
        NavigationLink(destination: ContactDetailView(usermodel: model)){
            Image("Contact")
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(40)
            // show name, email and age horizontally
            HStack {
                VStack{
                    Text(model.name)
                        .multilineTextAlignment(.leading)
                    
                    Text("\(model.phoneNumber)")
                        .font(.subheadline)
                        .foregroundColor(Color.blue)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
              /*  VStack{
                 
                 Button(action: {
                 self.selectedUserId = model.id
                 self.userSelected = true
                 }, label: {
                 Text("Edit")
                 .foregroundColor(Color.blue)
                 })
                 // by default, buttons are full width.
                 // to prevent this, use the following
                 .buttonStyle(PlainButtonStyle())
                 
                 // button to delete user
                 Button(action: {
                 
                 // create db manager instance
                 let dbManager: DB_Manager = DB_Manager()
                 
                 // call delete function
                 dbManager.deleteUser(idValue: model.id)
                 
                 // refresh the user models array
                 self.userModels = dbManager.getUsers()
                 }, label: {
                 Text("Delete")
                 .foregroundColor(Color.red)
                 })// by default, buttons are full width.
                 // to prevent this, use the following
                 .buttonStyle(PlainButtonStyle())
                 }*/
                // edit and delete button goes here
                // button to edit user
                
            }
        }
    }
}

