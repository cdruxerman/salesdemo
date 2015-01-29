//
//  ExploreProductView.swift
//  Glam
//
//  Created by Rajkumar Sharma on 29/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class ExploreProductView: UIView, UIScrollViewDelegate {
    
    var scrollView : UIScrollView!
    var pageControl : UIPageControl!
    var label1 : UILabel!
    var label2 : UILabel!
    var label3 : UILabel!
    var btnAdd : UIButton!
    var arrImg : NSArray!
    var arrButtons : NSMutableArray! = NSMutableArray()
    
    func createViewWithProduct(product : Product) {
        
        self.backgroundColor = UIColor.clearColor()
        
        var bgImg : UIImageView! = UIImageView(frame: CGRectMake(0, 118, 306, 40))
        bgImg.image = UIImage(named: "explore-img-bottom-bg")
        
        scrollView = UIScrollView(frame: CGRectMake(0, 0, 306, 118))
        scrollView.pagingEnabled = true
        pageControl = UIPageControl(frame: CGRectMake(8, 88, 39, 37))
        label1 = UILabel(frame: CGRectMake(8, 119, 231, 21))
        label2 = UILabel(frame: CGRectMake(8, 137, 81, 21))
        label3 = UILabel(frame: CGRectMake(87, 137, 114, 21))
        btnAdd = UIButton(frame: CGRectMake(247, 129, 46, 18))
        btnAdd.setImage(UIImage(named: "button-product-detail-add"), forState: UIControlState.Normal)
        
        self.label1.font = UIFont.systemFontOfSize(10)
        self.label2.font = UIFont.systemFontOfSize(14)
        self.label3.font = UIFont.systemFontOfSize(11)
        
        self.arrImg = product.arrImg
        self.label1.text = product.productTitle
        self.label2.text = product.productPrice
        self.label3.text = product.productCompany
        self.label3.textColor = UIColor.lightGrayColor()
        
        self.addSubview(scrollView)
        scrollView.delegate = self;
        if arrImg.count > 1 {
            self.addSubview(pageControl)
            pageControl.numberOfPages = arrImg.count
            pageControl.addTarget(self, action: Selector("pageControlValueChanged"), forControlEvents: UIControlEvents.TouchUpInside)
        }
        self.populateImages()
        self.addSubview(bgImg)
        self.addSubview(label1)
        self.addSubview(label2)
        self.addSubview(label3)
        self.addSubview(btnAdd)
    }
    
    func populateImages() {
        
        for index in 0...(arrImg.count - 1) {
            var btn : UIButton! = UIButton(frame: CGRectMake(CGFloat(index * 306), 0, 306, 118))
            btn.setImage(UIImage(named: arrImg.objectAtIndex(index) as String), forState: UIControlState.Normal)
            scrollView.addSubview(btn)
            arrButtons.addObject(btn)
        }
        scrollView.contentSize = CGSizeMake(CGFloat(arrImg.count * 306), 0)

    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(self.scrollView.contentOffset.x) / 306
    }
    
    func pageControlValueChanged(sender : UIPageControl) {
        self.scrollView.setContentOffset(CGPointMake(CGFloat((self.pageControl.currentPage ) * 306), 0), animated: true)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

}
