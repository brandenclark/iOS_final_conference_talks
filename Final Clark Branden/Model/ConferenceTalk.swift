//
//  ConferenceTalk.swift
//  Final Clark Branden
//
//  Created by Branden Clark on 12/19/18.
//  Copyright © 2018 Branden Clark. All rights reserved.
//

import Foundation
import GRDB

struct ConferenceTalk : TableRecord, FetchableRecord {
    
    // MARK: - Properties
    
    var id: Int
    var title: String
    var description: String

    
    // MARK: - Table mapping
    
    static let databaseTableName = "talk t JOIN conference_talk c JOIN conf_session s"
    
    // MARK: - Field names
    
    static let id = "ID"
    static let title = "Title"
    static let description = "Description"

    
    // MARK: - Initialization
    
    init() {
        id = 0
        title = ""
        description = ""
    }
    
    init(row: Row) {
        id = row[ConferenceTalk.id]
        title = row[ConferenceTalk.title]
        description = row[ConferenceTalk.description]
    }
}

