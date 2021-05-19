//
//  PostData.swift
//  H4X0R News UI
//
//  Created by locussigilli on 5/11/21.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]         //root folder [data]
}



struct Post: Decodable, Identifiable {
    
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int         // inside the root folder
    let title: String
    let url: String?
}
