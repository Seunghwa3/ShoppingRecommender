//
//  UserInformation.swift
//  ShoppingRecommender
//
//  Created by 이진호 on 2020/10/12.
//

import Foundation

class UserInformation {
    static let userInfo: UserInformation = UserInformation()
    var id: String?
    var password: String?
    var checkPassword: String?
    var sex: String?
    var birth: String?
}
