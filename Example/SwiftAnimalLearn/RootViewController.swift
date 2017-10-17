//
//  RootViewController.swift
//  SwiftAnimalLearn_Example
//
//  Created by 山梨 on 2017/10/17.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import UIKit
import SwiftAnimalLearn
import Pods_SwiftAnimalLearn_Example
import Pods_SwiftAnimalLearn_Tests

public let screenWidth:CGFloat = UIScreen.main.bounds.size.width
public let screenHeight:CGFloat = UIScreen.main.bounds.size.height

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var titleArr = ["翻动动画", "轮播图"]
    var tableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tableview = UITableView(frame: CGRect(x:0, y:0, width:screenWidth, height:screenHeight), style:UITableViewStyle.plain)
            tableview.dataSource = self
            tableview.delegate = self
            self.view.addSubview(tableview)
        // Do any additional setup after loading the view.
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let initIdentifier:String = "identtifier"
        var cell:SLTableViewCell? = (tableview.dequeueReusableCell(withIdentifier: initIdentifier) as? SLTableViewCell)
        if (cell == nil) {
            cell = SLTableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: initIdentifier) as SLTableViewCell
        }
        cell?.titleLab.text = titleArr[indexPath.row]
        return cell!;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let flipAnimationDemoVC = FlipAnimationDemoViewController()
            flipAnimationDemoVC.title = self.titleArr[indexPath.row]
            self.navigationController?.pushViewController(flipAnimationDemoVC, animated: true)
            break
        case 1:
            let carouseIfigureDemoVC = CarouselFigureViewController()
            carouseIfigureDemoVC.title = self.titleArr[indexPath.row]
            self.navigationController?.pushViewController(carouseIfigureDemoVC, animated: true)
            break
        default:
            print("没找着");
        }
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
