//
//  CarouseIfigreView.swift
//  SwiftAnimalLearn_Example
//
//  Created by 山梨 on 2017/10/17.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import UIKit

class CarouseIfigreView: UIView ,UIScrollViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    private var images : NSMutableArray = NSMutableArray()
    private var autoPlay : Bool = true
    private var pageControl : UIPageControl?
    private var imageScrollView : UIScrollView?
    private var isFromNet : Bool = false
    private var currentPage: NSInteger?
    private var leftImageView: UIImageView?
    private var centerImageView: UIImageView?
    private var rightImageView: UIImageView?
    
    convenience init(frame: CGRect, images:NSMutableArray, autoPlay:Bool, delay:TimeInterval) {
        self.init(frame: frame)
        
        self.images = images
        if images.count < 2 {
            self.autoPlay = false
            self.pageControl?.hidesForSinglePage = true
        }
        self.backgroundColor = UIColor.white
        createImageScrollView()
        createPageView()
        
    }
    
    private func createImageScrollView() {
        if self.images.count <= 0 {
            return
        }
        imageScrollView = UIScrollView(frame: self.bounds)
        self.imageScrollView = UIScrollView()
        self.imageScrollView?.frame = CGRect(x:0, y:0, width:self.bounds.width, height:self.bounds.height)
        imageScrollView?.showsHorizontalScrollIndicator = false
        imageScrollView?.showsVerticalScrollIndicator = false
        imageScrollView?.bounces = false
        imageScrollView?.delegate = self
        imageScrollView?.contentSize = CGSize(width:self.bounds.width*3, height:self.bounds.height)
        imageScrollView?.isPagingEnabled = true
        self.imageScrollView?.backgroundColor = UIColor.white
        imageScrollView?.alwaysBounceHorizontal = false
        imageScrollView?.contentOffset = CGPoint(x:self.bounds.width, y:0)
        self.currentPage = 0
        self.addSubview(imageScrollView!)
        
        leftImageView = UIImageView(frame: CGRect(x:0, y:0, width:self.bounds.width, height:self.bounds.height))
        leftImageView?.isUserInteractionEnabled = true
        
        centerImageView = UIImageView(frame: CGRect(x:self.bounds.size.width, y:0, width:self.bounds.width, height:self.bounds.height))
        leftImageView?.isUserInteractionEnabled = true
        
        rightImageView = UIImageView(frame: CGRect(x:self.bounds.size.width * 2, y:0, width:self.bounds.width, height:self.bounds.height))
        leftImageView?.isUserInteractionEnabled = true
        
        if (self.images.count == 1) {
            if self.isFromNet == true {
            } else {
                leftImageView?.image = UIImage(named:self.images[0] as! String)
                centerImageView?.image = UIImage(named:self.images[0] as! String)
                rightImageView?.image = UIImage(named:self.images[0] as! String)
            }
        } else {
            if self.isFromNet == true {
            } else {
                leftImageView?.image = UIImage(named:self.images.lastObject as! String)
                centerImageView?.image = UIImage(named:self.images[0] as! String)
                rightImageView?.image = UIImage(named:self.images[1] as! String)
            }
        }
        imageScrollView?.addSubview(leftImageView!)
        imageScrollView?.addSubview(centerImageView!)
        imageScrollView?.addSubview(rightImageView!)
    }
    //创建pageControl视图
    private func createPageView(){
        if self.images.count == 0 {
            return
        }
        let pageW: CGFloat = 80
        let pageH: CGFloat = 25
        let pageX: CGFloat = self.bounds.width - pageW
        let pageY: CGFloat = self.bounds.height - pageH
        pageControl = UIPageControl(frame: CGRect(x:pageX, y:pageY, width:pageW, height:pageH))
        pageControl?.numberOfPages = self.images.count
        pageControl?.currentPage = 0
        pageControl?.isUserInteractionEnabled = false
        self.addSubview(pageControl!)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        //print(x)
        let width = self.frame.width
        if x >= 2*width {
            currentPage = (currentPage!+1) % self.images.count
            pageControl!.currentPage = currentPage!
            refreshImages()
        }
        if x <= 0 {
            currentPage = (currentPage!+self.images.count-1) % self.images.count
            pageControl!.currentPage = currentPage!
            refreshImages()
        }
    }
    
    //每次图片滚动时刷新图片
    private func refreshImages(){
        let rightPageIndex = (currentPage! + 1) % self.images.count
        let leftPageIndex = (currentPage! + self.images.count - 1) % self.images.count
        
        self.centerImageView?.image = UIImage(named:self.images[currentPage!] as! String)
        self.leftImageView?.image = UIImage(named:self.images[leftPageIndex] as! String)
        self.rightImageView?.image = UIImage(named:self.images[rightPageIndex] as! String)
        //        for i in 0..<imageScrollView!.subviews.count {
        //            let imageView = imageScrollView!.subviews[i] as! UIImageView
        //            if self.isFromNet == true {
        //                //图片来自网络
        //            } else {
        //                imageView.image = UIImage(named: self.images[i] as! String);
        //            }
        //        }
        imageScrollView!.contentOffset = CGPoint(x:self.bounds.width, y:0)
    }
    
}
