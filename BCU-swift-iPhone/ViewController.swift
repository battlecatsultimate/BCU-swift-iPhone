//
//  ViewController.swift
//  BCU-swift-iPhone
//
//  Created by arthur on 2019/5/10.
//  Copyright © 2019年 BattleCatsUltimate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animView: AnimViewPage?
    var enemyList: EnemyListPage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func switchToViewController(_ toVC: UIViewController?) {
        if (toVC != nil) {
            addChild((toVC)!)
            view.addSubview((toVC?.view)!)
            toVC?.didMove(toParent: self)
        }
    }

    @IBAction func switchViews(_ sender: UIButton){
        let tag = sender.tag;
        
        // Create the new view controller, if required.
        if (tag == 1001) {
            if (animView == nil) {
                animView = (self.storyboard?.instantiateViewController(withIdentifier: "AnimView") as! AnimViewPage)
            }
            animView?.view.frame = view.frame
            switchToViewController(animView)
        }
    
    }
    
   


}

