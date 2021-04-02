//
//  ContactRow.swift
//  CRUD_SQLite
//
//  Created by Dmitrii Isupov on 01.04.2021.
//  Copyright © 2021 Adnan Afzal. All rights reserved.
//

import Foundation
import SwiftUI

struct ContactRow : View {
    let usermodel: UserModel
    
    var body: some View {
        HStack {
            Image(usermodel.photoUser)
                .resizable()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .clipped()
            
            VStack(alignment: .leading) {
                Text("\(usermodel.name) \(usermodel.email)").font(.headline)
                Text(usermodel.phoneNumber).font(.subheadline)
            }
            
            Spacer()
            
            
        }
    }
}
