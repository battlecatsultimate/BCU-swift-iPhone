//
//  DataEntity.swift
//  BCU-swift-iPhone
//
//  Created by arthur on 2019/5/10.
//  Copyright © 2019年 BattleCatsUltimate. All rights reserved.
//

import Foundation

public protocol MaskEntity {}

public protocol MaskUnit : MaskEntity {}
public protocol MaskEnemy : MaskEntity {}
public protocol MaskAtk {}

public class DataEntity : MaskEntity {}
public class DefaultData : DataEntity, MaskAtk {}
public class DataEnemy : DefaultData, MaskUnit {}
public class DataUnit : DefaultData, MaskUnit {}

public class CustomEntity : DataEntity {}
public class CustomEnemy : CustomEntity, MaskEnemy{}
public class CustomUnit : CustomEntity, MaskUnit{}
