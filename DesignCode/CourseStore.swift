//
//  CourseStore.swift
//  DesignCode
//
//  Created by Praveen on 09/05/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import SwiftUI
import Contentful
import Combine

let client = Client(spaceId: "jzf5o2kgg108", accessToken: "sgzwMIiZ2dYbyAr-412FINGeSJt8rKUOhrZgF7sC3ac")

func getArray(id: String, completion: @escaping ([Entry]) -> Void) {
    let query = Query.where(contentTypeId: id)
    client.fetchArray(of: Entry.self, matching: query) { result in
        print(result)
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
        case .error(let error):
            print(error)
        }
    }
}

class CourseStore: ObservableObject {
    @Published var courses: [Course] = courseData
    
    init() {
        getArray(id: "course") { (items) in
            items.forEach { (item) in
                self.courses.append(
                    Course(
                    title: item.fields["title"] as! String,
                    subtitle: item.fields["subtitle"] as! String,
                    image: #imageLiteral(resourceName: "Background1"),
                    logo: #imageLiteral(resourceName: "Logo3"),
                    color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),
                    show: false)
                )
            }
        }
    }
}
