//
//  RecodsCaretaker.swift
//  GameProject
//
//  Created by Дмитрий Паркалов on 3.08.22.
//

import Foundation

typealias Memento = Data

final class RecordsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "records"
    
    func save(records: [GameSession]) {
        do {
            let data: Memento = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retreveRecords() -> [GameSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        
        do {
            return try self.decoder.decode([GameSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
