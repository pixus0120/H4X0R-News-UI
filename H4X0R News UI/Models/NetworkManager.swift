//
//  NetworkManager.swift
//  H4X0R News UI
//
//  Created by locussigilli on 5/11/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()    ////    [ID,objectID,point,title,url]
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        
                   let results = try decoder.decode(Results.self, from: safeData)   //transfer data to CV
                        DispatchQueue.main.async {
                        self.posts = results.hits     //transfer data to CV
                        }
                        
                    } catch {
                        print(error)
                    }
                    }
                }
            }
            task.resume()
        }
    }
}
