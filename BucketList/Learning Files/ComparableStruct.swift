//
//  ComparableStruct.swift
//  BucketList
//
//  Created by Hakan Aktürk on 12.01.2023.
//

import Foundation

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    //MARK: - you can use .sorted() method directly with this code
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}
