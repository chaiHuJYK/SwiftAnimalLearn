//
//  FlipAnimationDemoViewController.swift
//  SwiftAnimalLearn_Example
//
//  Created by 山梨 on 2017/10/17.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import UIKit
// 翻页动画

let kImageFrameWidth = 100
let kImageFrameHeight = 100
class FlipAnimationDemoViewController: UIViewController {

    var imageViewOne: UIImageView = UIImageView()
    var imageViewTwo: UIImageView = UIImageView()
    var viewForImage:(UIView)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.setView()
        var oneTap = UITapGestureRecognizer(target: self, action: #selector(clickOneTap))
        oneTap.numberOfTapsRequired = 1;
        
        viewForImage.isUserInteractionEnabled = true
        viewForImage.addGestureRecognizer(oneTap)
    }
    
    func setView() -> Void {
        viewForImage = UIView()
        viewForImage.frame = CGRect(x:100, y:100, width:kImageFrameWidth, height:kImageFrameHeight)
        
        imageViewOne = UIImageView(image:UIImage(named:"dog.png"))
        imageViewTwo = UIImageView(image:UIImage(named:"dog2.jpg"))
        let imageViewThree = UIImageView(image:UIImage(named:"lr"))
        imageViewThree.frame = CGRect(x:0, y:0, width:kImageFrameWidth, height:kImageFrameHeight)
        
        imageViewOne.frame = CGRect(x:0, y:0, width:kImageFrameWidth, height:kImageFrameHeight)
        imageViewTwo.frame = CGRect(x:0, y:0, width:kImageFrameWidth, height:kImageFrameHeight)
        
        viewForImage.insertSubview(imageViewOne, at: 0)
        viewForImage.insertSubview(imageViewTwo, at: 1)
        viewForImage.insertSubview(imageViewThree, at: 2)
        self.view.addSubview(viewForImage)
    }
  
    //实现手势方法
    @objc func clickOneTap(sender: UITapGestureRecognizer)
    {
        //
        print("..............................");
        UIView.beginAnimations("changeImageAnimationId", context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationTransition(.flipFromRight, for:viewForImage , cache: true)
        //UIView.setAnimationTransition(.curlUp, for:viewForImage , cache: true)
        viewForImage.exchangeSubview(at: 2, withSubviewAt: 1)
        viewForImage.exchangeSubview(at: 1, withSubviewAt: 0)
        
        UIView.commitAnimations()
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
