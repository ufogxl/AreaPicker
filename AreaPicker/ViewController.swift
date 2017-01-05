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
        
        picker.frame = CGRect(x: 0,y: 0,width: 200,height: 400);
        picker.center = self.view.center
        self.view.addSubview(picker)
        let button = UIButton(frame: CGRect(x: 100,y: 30,width: 100,height: 30))
        button.titleLabel?.text = "昂昂昂"
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(ViewController.get), for: .touchUpInside)
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

