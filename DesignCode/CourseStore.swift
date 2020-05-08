//
//  CourseStore.swift
//  DesignCode
//
//  Created by Praveen on 09/05/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import SwiftUI
import Contentful

let client = Client(spaceId: "jzf5o2kgg108", accessToken: "sgzwMIiZ2dYbyAr-412FINGeSJt8rKUOhrZgF7sC3ac")

func getArray() {
    let query = Query.where(contentTypeId: "course")
    client.fetchArray(of: Entry.self, matching: query) { result in
        print(result)
    }
}

