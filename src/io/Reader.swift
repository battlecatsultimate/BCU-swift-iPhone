//
//  Reader.swift
//  BCU-swift-iPhone
//
//  Created by arthur on 2019/5/11.
//  Copyright © 2019 BattleCatsUltimate. All rights reserved.
//

import Foundation


public class Reader {
    
    public static func parseIntN(_ str : String) -> Int {
        let arr = parseIntsN(str)
        return arr.count > 0 ? arr[0] : -1
    }
    
    public static func parseIntsN(_ str : String) -> [Int] {
        var lstr : [Substring] = []
        var t : String.Index? = nil
        for i in 0 ..< str.count {
            let ind = str.index(str.startIndex, offsetBy: i)
            if t == nil {
                if (str.isDigit(ind) || str.charAt(ind) == "-" ){
                    t = ind
                }
            } else if (!str.isDigit(ind)) {
                lstr.append(str[t! ..< ind])
                t = nil
            }
        }
        if t != nil {
            lstr.append(str[t! ... str.endIndex])
        }
        var ans : [Int] = []
        for i in 0 ..< lstr.count {
            if lstr[i][lstr[i].startIndex] != "-" || lstr[i].count > 1 {
                ans.append(Int(lstr[i])!)
            }
        }
        return ans
    }
    
}
