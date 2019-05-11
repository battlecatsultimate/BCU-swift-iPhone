//
//  File.swift
//  BCU-swift-iPhone
//
//  Created by arthur on 2019/5/10.
//  Copyright © 2019年 BattleCatsUltimate. All rights reserved.
//

import Foundation

public class FixIndexList<T> {

    private var arr : [T?]
    private let len : Int
    private var size : Int = 0
    
    public init(_ l : Int){
        len=l
        arr = [T?](repeating: nil, count: len)
    }
    
    public func nextIndex()->Int{
        for i in 0 ..< len {
            if arr[i] == nil {
                return i
            }
        }
        return -1
    }
    
    public func add(_ t:T)-> Int{
        let ind = nextIndex()
        arr[ind]=t
        size += 1
        return ind
    }
    
    public func set(_ t : T, ind : Int){
        if arr[ind] == nil {
            size += 1
        }
        arr[ind]=t
    }
    
    public func toList()->[T]{
        var ans : [T] = []
        for t : T? in arr {
            if t != nil {
                ans.append(t!)
            }
        }
        return ans
    }
    
    public func toMap() -> [Int:T] {
        var ans : [Int:T] = [:]
        for i in 0 ..< len {
            if arr[i] != nil {
                ans.updateValue(arr[i]! ,forKey: i)
            }
        }
        return ans
    }
    
    public func forEach(_ body : (Int,T)->Void) {
        for i in 0 ..< len {
            if arr[i] != nil {
                body(i,arr[i]!)
            }
        }
    }
    
}
