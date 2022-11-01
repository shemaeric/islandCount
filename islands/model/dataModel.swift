//
//  dataModel.swift
//  islands
//
//  Created by Eric Shema on 01/11/2022.
//

import Foundation


struct DataModel {
    
    var data: [[Int]] = Array(repeating: Array(repeating: 0, count: 6), count: 10)
    
    let dataSize = 60

    var islands = 0
    
    mutating func updateData(id: Int) {
        
        
        let element = findValue(id: id)
        guard (element != nil) else { return }
        
        
        if(element!.value == 0) {
            data[element!.row][element!.column] = 1
        }
        else {
            data[element!.row][element!.column] = 0
        }
        
    }
    
    func findValue(id: Int) -> (value: Int, row: Int, column: Int)? {
        
        let row = id / 6
        guard row < data.count else { return nil}
        
        let column = (id % 6)
        guard column < data[0].count else { return nil }
        
        let result = data[row][column]
        
        return (value: result, row: row, column: column)
    }
}
