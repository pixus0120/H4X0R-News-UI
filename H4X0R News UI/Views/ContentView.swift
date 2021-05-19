//
//  ContentView.swift
//  H4X0R News UI
//
//  Created by locussigilli on 5/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url)) {
                HStack {
                    Text(String(post.points))
                    Text(post.title)
                    }
                }
            }
            .navigationTitle("H4X0R News")
        }
        .onAppear{  //viewdidLoad
            self.networkManager.fetchData()
        }
    }
}

//MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: - Extensions

/*

let posts = [
    Post(id: "1", title: "Hello "),
    Post(id: "2", title: "Bonjour"),
    Post(id: "3", title: "Hola")
]
*/
