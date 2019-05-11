//
//  Pack.swift
//  BCU-swift-iPhone
//
//  Created by arthur on 2019/5/10.
//  Copyright © 2019年 BattleCatsUltimate. All rights reserved.
//

import Foundation

public class Pack {

    public static let DEF : Pack = Pack()
    
    public static var MAP : [Int:Pack] = [:]
    
    public let id : Int
    public let es : EnemyStore
    public let us : UnitStore
    
    private init(){
        id = 0
        es = EnemyStore(id)
        us = UnitStore(id)
        Pack.MAP.updateValue(self,forKey : id)
    }

}

public class EnemyStore : FixIndexList<Enemy> {
    
    public let pid : Int
    
    fileprivate override init(_ id : Int){
        pid=id
        super.init(500)
    }

}

public class UnitStore : FixIndexList<Unit> {
    
    public let ullist : FixIndexList<UnitLevel> = FixIndexList<UnitLevel>(100)
    
    public let pid : Int
    
    fileprivate override init(_ id : Int){
        pid=id
        super.init(1000)
    }
    
}

public class Enemy {

}

public class Unit {

}

public class Form {

}

public class UnitLevel {

}
