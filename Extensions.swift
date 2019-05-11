//
//  Extensions.swift
//  BCU-swift-iPhone
//
//  Created by arthur on 2019/5/11.
//  Copyright © 2019 BattleCatsUltimate. All rights reserved.
//

import Foundation

extension String {
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func split(_ str : String) -> [String] {
        return self.components(separatedBy: str)
    }
    
    func charAt(_ ind : String.Index) -> Unicode.Scalar {
        let ch = self[ind].unicodeScalars
        return ch[ch.startIndex]
    }
    
    func isDigit(_ ind : String.Index) -> Bool {
        return CharacterSet.decimalDigits.contains(charAt(ind))
    }
    
}
