//
//  ExploreViewController.swift
//  Glam
//
//  Created by Rajkumar Sharma on 29/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var topScroll : UIScrollView!
    @IBOutlet var contentScroll : UIScrollView!
    @IBOutlet var pageControl : UIPageControl!
    @IBOutlet var topNavView : UIView!
    
    var arrProduct : NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topScroll.contentSize = CGSizeMake(960, 0)
        self.createProducts()
        self.populateScrollView()
        self.navigationController?.navigationBar.hidden = true
        topNavView.layer.shadowColor = UIColor.grayColor().CGColor
        topNavView.layer.shadowRadius = 0.4
        topNavView.layer.shadowOffset = CGSizeMake(0, 1)
        topNavView.layer.shadowOpacity = 1
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createProducts() {
        var product1 = Product(title: "Ally Capellino Frank Brown - Fott Shop 2010", prodName: "Ally Capellino Frank Brown - Fott Shop 2010", prodPrice: "$200-$500", prodDesc: "Sample", company: "Shop.fott.com", images: ["explore-img1","explore-img1","explore-img1"])
        var product2 = Product(title: "TAP & DYE LEGACY", prodName: "TAP & DYE LEGACY", prodPrice: "$68", prodDesc: "Sample", company: "Tapanddye", images: ["explore-img2","explore-img2","explore-img2"])
        var product3 = Product(title: "Speaker", prodName: "Speak-er", prodPrice: "$50-$100", prodDesc: "Sample", company: "Thinkofthe", images: ["explore-img3","explore-img3","explore-img3"])
        var product4 = Product(title: "Piper Felt Hat by Brixton", prodName: "Piper Felt Hat by Brixton", prodPrice: "$62", prodDesc: "Sample", company: "Tapanddye", images: ["explore-img4","explore-img4","explore-img4"])
        var product5 = Product(title: "HIKE Abysss Stone", prodName: "HIKE Abysss Stone", prodPrice: "$42", prodDesc: "Sample", company: " ", images: ["explore-img5","explore-img5","explore-img5"])
        arrProduct.addObject(product1)
        arrProduct.addObject(product2)
        arrProduct.addObject(product3)
        arrProduct.addObject(product4)
        arrProduct.addObject(product5)
    }

    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }

    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false
    }
    
    func populateScrollView() {
        
        for index in 0...(arrProduct.count-1) {
            var currentProduct : Product = arrProduct.objectAtIndex(index) as Product
            var currentView : ExploreProductView! = ExploreProductView(frame: CGRectMake(7, CGFloat(210 + index * 170), 306, 158))
            currentView.createViewWithProduct(currentProduct)
            contentScroll.addSubview(currentView)
            for button in currentView.arrButtons {
                button.addTarget(self, action: Selector("productSelected:"), forControlEvents: UIControlEvents.TouchUpInside)
            }
        }
        contentScroll.contentSize = CGSizeMake(0,CGFloat(arrProduct.count * 170 + 20))
    }
        
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if scrollView == self.topScroll {
            self.pageControl.currentPage = Int(self.topScroll.contentOffset.x) / 320
        }
    }
    
    @IBAction func pageControlValueChanged(sender : UIPageControl) {
        self.topScroll.setContentOffset(CGPointMake(CGFloat((self.pageControl.currentPage ) * 320), 0), animated: true)
    }

    @IBAction func productSelected(sender: UIButton) {
        self.performSegueWithIdentifier("pushProductDetail", sender: sender)
    }

    @IBAction func showCart(sender : UIButton) {
        var appDelegate : AppDelegate! = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.menuViewContorller.showCart()
    }
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == self.contentScroll {
            if scrollView.contentOffset.y < 91 {
                self.topNavView.alpha = scrollView.contentOffset.y/91.0
            } else {
                UIView.animateWithDuration(0.2, delay: 0, options:nil, animations: {
                    self.topNavView.alpha = 1
                    }, completion: nil)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
