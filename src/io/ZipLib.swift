//
//  ZipLib.swift
//  BCU-swift-iPhone
//
//  Created by arthur on 2019/5/11.
//  Copyright © 2019 BattleCatsUltimate. All rights reserved.
//

import Foundation

public class ZipLib {}

public class LibInfo {
    
    let ver : String
    
    private var libver : [String : VerInfo] = [:]
    
    fileprivate let merge : MergedLib = MergedLib()
    
    init(){
        ver = "000000"
    }
    
    init(_ v : String){
        ver = v
    }
    
    public func merge(_ li : LibInfo) {
        let ls : [PathInfo] = merge.merge(li.merge)
        for p in ls {
            if p.type == 0 {
                //Path target = fs.getPath(p.path);
                //Files.createDirectories(target.getParent());
                //Files.copy(li.fs.getPath(p.path), target, RE);
            } else if p.type == 1 {
                //Files.deleteIfExists(fs.getPath(p.path));
            }
        }
        for (v,l) in li.libver {
            if !libver.keys.contains(v){
                //Files.copy(li.fs.getPath("/info/" + v + ".verinfo"), fs.getPath("/info/" + v + ".verinfo"));
                libver.updateValue(l ,forKey: v);
            }
        }
        //Path pini = fs.getPath("/info/info.ini");
        //Files.deleteIfExists(pini);
        //BufferedWriter bw = Files.newBufferedWriter(pini);
        //bw.write("file_version = 00040510\r\n");
        //bw.write("number_of_libs = " + libver.size() + "\r\n");
        //for (VerInfo vi : libver.values())
            //bw.write(vi.ver + "\r\n");
        //bw.close();
        
    }
    
    public func update(_ list : [String]) -> [String] {
        var ans : [String] = []
        for s in list {
            if !merge.set.contains(s) {
                ans.append(s)
            }
        }
        return ans
    }
    
}

fileprivate class VerInfo {
    
    let ver : String
    var paths : [String:PathInfo] = [:]
    
    init(){
        ver = "000000"
    }
    
    init(_ v : String){
        ver = v
    }
    
    fileprivate func write(){
        //PrintStream ps = Writer.newFile(str);
        //ps.println("file_version = 00040510");
        //ps.println("lib_version = " + ver);
        //ps.println("number_of_paths = " + paths.size());
        //for (PathInfo p : paths)
            //ps.println(p.toString());
        //ps.close();
    }
  
    
}

fileprivate class MergedLib {
    
    var set : Set<String> = []
    
    var paths : [String : PathInfo] = [:]
    
    fileprivate func add(_ vi : VerInfo){
        set.insert(vi.ver)
        for (s,p) in vi.paths {
            if isNew(p){
                paths.updateValue(p, forKey: s)
            }
        }
    }
    
    fileprivate func merge(_ ml : MergedLib) -> [PathInfo] {
        var ans : [PathInfo] = []
        for (s,p) in ml.paths {
            if isNew(p) {
                ans.append(p)
                paths.updateValue(p, forKey: s)
            }
        }
        return ans
    }
    
    private func isNew(_ p : PathInfo) -> Bool {
        return paths[p.path]?.update(p) ?? true
    }
    
}

fileprivate class PathInfo {
    
    private static let TYPES : [String] = ["Add:","Delete:"]
    
    private static func getType(_ str : String)-> Int {
        for i in 0 ..< TYPES.count {
            if str == TYPES[i] {
                return i
            }
        }
        return -1;
    }
    
    let path : String
    let ver : String;
    let type : Int;
    
    init(_ input : String, _ v : String){
        ver = v
        let strs : [String] = input.split("\t")
        path = strs[1].trim()
        type = PathInfo.getType(strs[0].trim())
    }
    
    init(_ p : String, _ v : String, _ t : Int){
        path = p;
        ver = v;
        type = t;
    }
    
    func update(_ p : PathInfo) -> Bool {
        assert (path == p.path)
        return Reader.parseIntN(ver) < Reader.parseIntN(p.ver)
    }
    
}
