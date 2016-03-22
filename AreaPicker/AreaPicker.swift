//
//  AreaPicker.swift
//  PickerView
//
//  Created by ufogxl on 16/3/21.
//  Copyright © 2016年 ufogxl. All rights reserved.
//

import UIKit

class AreaPicker: UIPickerView,UIPickerViewDataSource,UIPickerViewDelegate {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.delegate = self
        self.dataSource = self
        let pathURL = NSBundle.mainBundle().URLForResource("area", withExtension: "plist")
        provinces = NSArray(contentsOfURL: pathURL!)
        cities = [["北京市":123]]
        districts = ["东城区"]
    }
    
    var area:(province:String,city:String,disricts:String) = ("北京市","北京市","东城区")
    var provinces:NSArray!
    var province:NSDictionary!
    var cities:NSArray = []
    var city:NSDictionary!
    var districts:NSArray = []
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component{
        case 0: return provinces.count
        case 1: return cities.count
        case 2: return districts.count
        default:return 0
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component{
        case 0:
            province = provinces[row] as! NSDictionary
            for(key,_) in province{
                return key as? String
            }
        case 1:
            city = cities[row] as! NSDictionary
            for (key,_) in city{
                return key as? String
            }
        case 2:
            return districts[row] as? String
        default: return "--"
        }
        return "--"
    }
    

    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component{
            
        case 0: return pickerView.frame.width*3/7
        case 1: return pickerView.frame.width*2/7
        case 2: return pickerView.frame.width*2/7
        default:return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            //更改城市和区的数据源
            province = provinces[row] as! NSDictionary
            for (_,value) in province{
                cities = value as! NSArray
            }
            let cit = cities[0] as! NSDictionary
            for(_,value) in cit{
                districts = value as! NSArray
            }
            //设置滚回，刷新
            pickerView.selectRow(0, inComponent: 1, animated: true)
            pickerView.selectRow(0, inComponent: 2, animated: true)
            pickerView.reloadComponent(1)
            pickerView.reloadComponent(2)
        }else if component == 1{
            //更改区的数据源
            city = cities[row] as! NSDictionary
            for(_,value) in city{
                districts = value as! NSArray
            }
            pickerView.selectRow(0, inComponent: 2, animated: true)
            pickerView.reloadComponent(2)
        }
    }

    func getArea()->(province:String,city:String,disricts:String){
        let shengrow = self.selectedRowInComponent(0)
        let sheng = provinces[shengrow] as! NSDictionary
        for(key,_) in sheng{
            area.province = key as! String
        }
        let shirow = self.selectedRowInComponent(1)
        let shi = cities[shirow] as! NSDictionary
        for(key,_) in shi{
            area.city = key as! String
        }
        let qurow = self.selectedRowInComponent(2)
        area.disricts = districts[qurow] as! String
        return area
    }
    
}


