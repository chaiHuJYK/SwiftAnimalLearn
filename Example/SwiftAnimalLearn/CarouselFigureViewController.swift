//
//  CarouselFigureViewController.swift
//  SwiftAnimalLearn_Example
//
//  Created by 山梨 on 2017/10/17.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import UIKit
//轮播图

let serverImages:NSMutableArray = ["timg1.jpg", "timg2.jpg", "timg3.jpg", "timg4.jpg"]

class CarouselFigureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false;
        let carouseView = CarouseIfigreView(frame:CGRect(x:0, y:64 + 100, width:screenWidth, height:64 * 2), images:serverImages, autoPlay:true, delay:2)
        self.view.addSubview(carouseView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
