//
//  ViewController.swift
//  AreaPicker
//
//  Created by ufogxl on 16/3/21.
//  Copyright © 2016年 ufogxl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.frame = CGRectMake(0,0,200,400);
        picker.center = self.view.center
        self.view.addSubview(picker)
        let button = UIButton(frame: CGRectMake(100,30,100,30))
        button.titleLabel?.text = "昂昂昂"
        button.backgroundColor = .grayColor()
        button.addTarget(self, action: "get", forControlEvents: .TouchUpInside)
        print(button.frame)
        self.view.addSubview(button)
    }
    let picker = AreaPicker()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func get(){
        print(picker.getArea())
    }
}

