//
//  ActivityViewController.swift
//  Glam
//
//  Created by Rajkumar Sharma on 29/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {

    @IBOutlet var contentScroll : UIScrollView!
    var arrProduct : NSMutableArray! = NSMutableArray()
    @IBOutlet var topNavView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createProducts()
        self.populateScrollView()
        
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
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false
    }
    
    func createProducts() {
        var product1 = Product(title: "Ally Capellino Frank Brown - Fott Shop 2010", prodName: "Ally Capellino Frank Brown - Fott Shop 2010", prodPrice: "$200-$500", prodDesc: "Sample", company: "Shop.fott.com", images: ["on-sale-item1"])
        var product2 = Product(title: "TAP & DYE LEGACY", prodName: "TAP & DYE LEGACY", prodPrice: "$68", prodDesc: "Sample", company: "Tapanddye", images: ["on-sale-item2"])
        var product3 = Product(title: "Speaker", prodName: "Speak-er", prodPrice: "$50-$100", prodDesc: "Sample", company: "Thinkofthe", images: ["on-sale-item3"])
        var product4 = Product(title: "Piper Felt Hat by Brixton", prodName: "Piper Felt Hat by Brixton", prodPrice: "$62", prodDesc: "Sample", company: "Tapanddye", images: ["on-sale-item4"])
        arrProduct.addObject(product1)
        arrProduct.addObject(product2)
        arrProduct.addObject(product3)
        arrProduct.addObject(product4)
        arrProduct.addObject(product4)
        arrProduct.addObject(product3)
        arrProduct.addObject(product2)
        arrProduct.addObject(product1)
    }
    
    func populateScrollView() {
        
        var lastHeightA : Float = 150.0
        var lastHeightB : Float = 150.0
        
        for index in 0...(arrProduct.count-1) {
            var currentProduct : Product = arrProduct.objectAtIndex(index) as Product
            var currentView : ActivityProductView! = ActivityProductView(frame: CGRectMake(0, 0, 150, 150))
            currentView.createViewWithProduct(currentProduct)
            if (index % 2 == 0) {
                currentView.frame = CGRectMake(6, CGFloat(lastHeightA), 150, CGFloat(currentView.getHeightForView()))
                lastHeightA = currentView.getHeightForView() + lastHeightA + 10
            } else {
                currentView.frame = CGRectMake(164, CGFloat(lastHeightB), 150, CGFloat(currentView.getHeightForView()))
                lastHeightB = currentView.getHeightForView() + lastHeightB + 10
            }
            currentView.btnProduct.addTarget(self, action: Selector("productBtnTapped:"), forControlEvents: UIControlEvents.TouchUpInside)
            contentScroll.addSubview(currentView)
            contentScroll.contentSize = CGSizeMake(0, CGFloat (lastHeightA > lastHeightB ? lastHeightA : lastHeightB))
        }
    }
    
    @IBAction func productBtnTapped (sender : AnyObject) {
        self.performSegueWithIdentifier("PushToDetail", sender: sender)
    }

    @IBAction func showCart(sender : UIButton) {
        var appDelegate : AppDelegate! = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.menuViewContorller.showCart()
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == self.contentScroll {
            if scrollView.contentOffset.y < 70 {
                self.topNavView.alpha = scrollView.contentOffset.y/70.0
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
