//
//  CitationDatabase.swift
//  Final Clark Branden
//
//  Created by Branden Clark on 12/19/18.
//  Copyright © 2018 Branden Clark. All rights reserved.
//

import Foundation
import GRDB

class CitationDatabase {
    
    // MARK: - Constants
    
    struct Constant {
        static let fileName = "core.23"
        static let fileExtension = "db"
        static let ChapterTable = "next_chapter"
        static let NextChapterField = "NextBookChapter"
        static let PrevChapterField = "PrevBookChapter"
        static let CurrChapterField = "BookChapter"
        static let ChapterIdConverterForBook = 1000
    }
    
    // MARK: - Properties
    
    var dbQueue: DatabaseQueue!
    
    // MARK: - Singleton
    
    // See http://bit.ly/1tdRybj for a discussion of this singleton pattern.
    static let sharedDatabase = CitationDatabase()
    
    fileprivate init() {
        // This guarantees that code outside this file can't instantiate a GeoDatabase.
        // So others must use the sharedGeoDatabase singleton.
        print(Bundle.main.bundlePath)
        dbQueue = try? DatabaseQueue(path: Bundle.main.path(forResource: Constant.fileName,
                                                            ofType: Constant.fileExtension)!)
    }
    
    // MARK: - Helpers
    func test() {
        do {
            let book = try dbQueue.inDatabase { (db: Database) -> String in
                let row = try Row.fetchOne(db,
                                           "select last_updated from updated;")
                if row != nil {
                    return String(row?["last_updated"] ?? "No DB Connection")
                }
                
                return "No DB Conn"
                
            }
            
            print(book)
        } catch {
            print("Failure")
        }
    }
    
    func conferenceList() -> [Conference] {
        do {
            print()
            let conferences = try dbQueue.inDatabase { (db: Database) -> [Conference] in
                var conferences = [Conference]()
                
                let rows = try Row.fetchCursor(db,
                                               "select \(Conference.id) from \(Conference.databaseTableName) " +
                                                "order by \(Conference.orderBy)")
                while let row = try rows.next() {
                    conferences.append(Conference(row: row))
                }
                
                return conferences
            }
            
            return conferences
        } catch {
            return [Conference]()
        }
    }

}
