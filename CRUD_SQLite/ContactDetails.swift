//
//  ContactDetails.swift
//  CRUD_SQLite
//
//  Created by Dmitrii Isupov on 31.03.2021.
//  Copyright © 2021 Adnan Afzal. All rights reserved.
//
/*
import SwiftUI

struct ContactDetails: View {
    // array of user models
    @State var userModels: [UserModel] = []
    
    // check if user is selected for edit
    @State var userSelected: Bool = false
    
    // id of selected user to edit or delete
    @State var selectedUserId: Int64 = 0
    var body: some View {
        VStack{
            List(self.userModels){ (model) in
            Image("Contact")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                .shadow(radius: 10)
                
                VStack{
                    Text(model.name)
                        .font(.title)
                    Text(model.email)
                        .font(.subheadline)
                    Text(model.phoneNumber)
                        .font(.subheadline)
                }
        }
    }
}
}

struct ContactDetails_PreviewsProvider {
    static var previews: some View {
        ContactDetails()
    }
}
*/

import SwiftUI

struct ContactDetail : View {
    @State var userModels: [UserModel] = []
    
    // check if user is selected for edit
    @State var userSelected: Bool = false
    
    // id of selected user to edit or delete
    @State var selectedUserId: Int64 = 0
   // @EnvironmentObject var userData: UserData
    var usermodel: UserModel
    
   
    
    var body: some View {
        VStack {
            Image(usermodel.photoUser)
                .resizable()
                .clipShape(Circle())
                .frame(width: 200, height: 200)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            HStack {
                Text("\(usermodel.name) \(usermodel.phoneNumber)")
                    .font(.largeTitle)
            }
            
            HStack {
                Text("Phone")
                Spacer()
                Text(usermodel.phoneNumber)
                }.padding(.bottom, 5)
            
            HStack {
                Text("Email")
                Spacer()
                Text(usermodel.email)
                }.padding(.bottom, 5)
            
            HStack {
                Text("Address")
                Spacer()
                
               /* VStack(alignment: .trailing) {
                    Text(usermodel.).color(.gray)
                    Text("\(contact.city), \(contact.state) \(contact.zip)").color(.gray)
                }*/
            }.padding(.bottom, 5)
            
            Spacer()
        }.padding(40)
    }
}
