//
//  File.swift
//  BCU-swift-iPhone
//
//  Created by arthur on 2019/5/10.
//  Copyright © 2019年 BattleCatsUltimate. All rights reserved.
//

import Foundation

public class VFile {
	
	public static let ROOT : VFileRoot = VFileRoot(".")
	
	public var name : String
	
	private let parent : VFile?
	
	private let subs : [VFile]?
	
	private let data : FileData?
	
	fileprivate init(_ str: String, _ vf : VFile?, _ fd : FileData?){
		name = str
		parent = vf
		subs = fd == nil ? [] : nil
		data=fd
	}
	
	public func list() -> [VFile]? {
		return subs;
	}
	
}

public class VFileRoot : VFile {

	public init(_ str : String){
		super.init(str,nil,nil)
	}
	
	public func build(_ path : String, _ fd : FileData?)-> VFile{
		let strs : [String] = path.components(separatedBy: "/")
		var par : VFile = self
		for i in 1 ..< strs.count {
			var next : VFile? = nil
			for ch in par.list()! {
				if(ch.name == strs[i]){
					next=ch
				}
			}
			if next == nil {
				if i == strs.count - 1 {
					return VFile(strs[i],par,fd)
				}
				else {
					next = VFile(strs[i],par,nil)
				}
			}
			par = next!
		}
		return self
	}
	
	public func getFile(_ path : String)-> VFile?{
		let strs : [String] = path.components(separatedBy: "/")
		var par : VFile = self
		for i in 1 ..< strs.count {
			var next : VFile? = nil
			for ch in par.list()! {
				if(ch.name == strs[i]){
					next=ch
				}
			}
			if next == nil {
				return nil
			}
			if i == strs.count - 1 {
				return next
			}
			par = next!
		}
		return self
	}


}

public protocol FileData {

}
