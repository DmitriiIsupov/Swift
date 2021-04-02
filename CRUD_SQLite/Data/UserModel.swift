//
//  UserModel.swift
//  CRUD_SQLite
//
//  Created by Dmitrii Isupov on 25.03.2021.
//

import Foundation

class UserModel: Identifiable {
    public var id: Int64 = 0
    public var name: String = ""
    public var email: String = ""
   // public var age: Int64 = 0
    public var phoneNumber: String = ""
    public var photoUser: String = ""
 
}
