//
//  TestListDataModel.swift
//  LuUiKit
//
//  Created by VN Savis on 28/02/2024.
//

import Foundation

class TestDataModel: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }

    init(userID: Int?, id: Int?, title: String?, body: String?) {
        self.userID = userID
        self.id = id
        self.title = title
        self.body = body
    }
}

typealias TestListDataModel = [TestDataModel]
