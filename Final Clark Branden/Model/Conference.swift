//
//  Conference.swift
//  Final Clark Branden
//
//  Created by Branden Clark on 12/19/18.
//  Copyright © 2018 Branden Clark. All rights reserved.
//

import Foundation
import GRDB

struct Conference : TableRecord, FetchableRecord {
    
    // MARK: - Properties
    
    var id: Int
    var abbr: String
    
    // MARK: - Table mapping
    
    static let databaseTableName = "conference"
    static let orderBy = "IssueDate DESC"
    
    // MARK: - Field names
    
    static let id = "ID"
    static let abbr = "Abbr"
    
    
    // MARK: - Initialization
    
    init() {
        id = 0
        abbr = ""
    }
    
    init(row: Row) {
        id = row[Conference.id]
        abbr = row[Conference.abbr]
    }
}


