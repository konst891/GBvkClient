//
//  UserModel.swift
//  VKClient
//
//  Created by Константин Надоненко on 28.12.2020.
//

import Foundation
import RealmSwift

class UserResponse: Decodable {
    let response: UserItems
}

class UserItems: Decodable {
    let items: [User]
}

class User: Object, Decodable {
    var sizes = RealmSwift.List<Size>()
    @objc dynamic var id = 0

    enum CodingKeys: String, CodingKey {
        case sizes
        case id
    }

    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.sizes = try values.decode(List<Size>.self, forKey: .sizes)
        self.id = try values.decode(Int.self, forKey: .id)
    }
}

class Size: Object, Decodable {

    @objc dynamic var url: String?

    enum CodingKeys: String, CodingKey {
        case url
    }

    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try values.decode(String.self, forKey: .url)
    }
}
