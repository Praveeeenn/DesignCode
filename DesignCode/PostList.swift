//
//  PostList.swift
//  DesignCode
//
//  Created by Praveen on 08/05/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import SwiftUI

struct PostList: View {
    @State var posts: [Post] = []
    var body: some View {
        List(posts) { post in
            Text(post.title)
        } .onAppear {
            API().getPost { (posts) in
                self.posts = posts
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
