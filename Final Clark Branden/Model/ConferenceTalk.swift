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
    var speakerFirstName: String
    var speakerLastName: String

    
    // MARK: - Table mapping
    
    static let databaseSelectColumns = "t.ID, t.Title, s.Description, p.LastNames, p.GivenNames"
    static let databaseTableName = "talk t JOIN conference_talk c JOIN conf_session s JOIN speaker p"
    static let databaseJoinWhere = "t.ID=c.TalkID AND c.SessionID=s.ID AND t.SpeakerID = p.ID AND s.ConferenceID ="
    static let databaseOrderBy = "s.Sequence, c.Sequence"
    
    // MARK: - Field names
    
    static let id = "ID"
    static let title = "Title"
    static let description = "Description"
    static let speakerLastName = "LastNames"
    static let speakerFirstName = "GivenNames"

    
    // MARK: - Initialization
    
    init() {
        id = 0
        title = ""
        description = ""
        speakerFirstName = ""
        speakerLastName = ""
        
    }
    
    init(row: Row) {
        id = row[ConferenceTalk.id]
        title = row[ConferenceTalk.title]
        description = row[ConferenceTalk.description]
        speakerFirstName = row[ConferenceTalk.speakerFirstName]
        speakerLastName = row[ConferenceTalk.speakerLastName]
    }
}

