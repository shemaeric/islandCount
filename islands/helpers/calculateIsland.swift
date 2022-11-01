//
//  calculateIsland.swift
//  islands
//
//  Created by Eric Shema on 01/11/2022.
//

import Foundation

class Helper {
    
    public func numberOfIslands(data: [[Int]]) -> Int {
        
        // I am sure that there will be equal Ten rows, We can also use 10 number of rows
        let rows = data.count
        // Taking care of edge rows where columns are 0
        guard rows > 0 else { return 0 }
        
        // I am sure that there will be equal Six columns, We can also use 6 number of columns
        let columns = data[0].count
        
        // Taking care of edge case where columns are 0
        guard columns > 0 else { return 0}
        
        // Keep count of visited edges
        var visited = Array(repeating: Array(repeating: false, count: columns), count: rows)
        
        var islands = 0
        
        for itemRow in 0..<rows {
            
            for itemColumn in 0..<columns {
                if isIsland(data: data, row: itemRow, column: itemColumn, rowsCount: rows, columnsCount: columns, visited: &visited) {
                    islands += 1
                }
            }
        }
        
        return islands
        
    }
    
    private func isIsland(data: [[Int]], row: Int, column: Int, rowsCount: Int, columnsCount: Int, visited: inout [[Bool]]) -> Bool {
        
        // First we check if we have visited this edge, if it's already visited then we will return
        guard !visited[row][column] else { return false }
        visited[row][column] = true
        
        // Check if the value is 1 then it will be island else return false
        guard data[row][column] == 1 else { return false }
        
        let coordinate = Positions(row: row, column: column)
        
        coordinate.neighbours(rowsCount: rowsCount, columnsCount: columnsCount).forEach { (c) in
            _ = isIsland(data: data, row: c.row, column: c.column, rowsCount: rowsCount, columnsCount: columnsCount, visited: &visited)
        }
        
        return true
    }
}

private struct Positions {
    let row: Int
    let column: Int
    
    init(row: Int, column: Int) {
        self.row = row
        self.column = column
    }
    
    // Check all Four neighbors -> Top, Down, Left and Right
    func neighbours(rowsCount: Int, columnsCount: Int) -> [Positions] {
        var result = [Positions]()
        if let t = top() {
            result.append(t)
        }
        if let l = left() {
            result.append(l)
        }
        if let b = bottom(rowsCount: rowsCount) {
            result.append(b)
        }
        if let r = right(columnsCount: columnsCount ) {
            result.append(r)
        }
        return result
    }
    
    private func top() -> Positions? {
        guard row > 0 else { return nil }
        return Positions(row: row-1, column: column)
    }
    
    private func left() -> Positions? {
        guard column > 0 else { return nil }
        return Positions(row: row, column: column-1)
    }
    
    private func bottom(rowsCount: Int) -> Positions? {
        guard row < rowsCount - 1 else { return nil }
        return Positions(row: row+1, column: column)
    }
    
    private func right(columnsCount: Int) -> Positions? {
        guard column < columnsCount - 1 else { return nil }
        return Positions(row: row, column: column+1)
    }
}
