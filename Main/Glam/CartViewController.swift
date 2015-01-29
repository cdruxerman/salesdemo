//
//  CartViewController.swift
//  Glam
//
//  Created by Rajkumar Sharma on 29/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet var cartScroll : UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0...5 {
            if (index % 2 == 0) {
                self.populateCart(CGFloat(9 + index * 160))
            } else {
                self.populateCart1(CGFloat(9 + index * 160))
            }
            cartScroll.contentSize = CGSizeMake(CGFloat(index * 160 + 160), 0)
        }
       // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateCart(xValue :CGFloat) {
        var productView : UIView! = UIView(frame: CGRectMake(xValue, 22, 146, 198))
        var productImg : UIImageView! = UIImageView(frame: CGRectMake(0, 0, 146, 198))
        productImg.image = UIImage(named: "checkout-item1.png")
        var lbl1 : UILabel! = UILabel(frame: CGRectMake(8,145, 121, 16))
        lbl1.textColor = UIColor.whiteColor()
        lbl1.font = UIFont.systemFontOfSize(11)
        lbl1.text = "Ally Capellino"
        var lbl2 : UILabel! = UILabel(frame: CGRectMake(8, 157, 121, 16))
        lbl2.textColor = UIColor.whiteColor()
        lbl2.font = UIFont.systemFontOfSize(9)
        lbl2.text = "Ally Capellino"
        var lbl3 : UILabel! = UILabel(frame: CGRectMake(8, 173, 30, 16))
        lbl3.textColor = UIColor.whiteColor()
        lbl3.font = UIFont.systemFontOfSize(11)
        lbl3.text = "$210"
        var lbl4 : UILabel! = UILabel(frame: CGRectMake(40, 173, 30, 16))
        lbl4.textColor = UIColor(red: 0.0/255.0, green: 181.0/255.0, blue: 229.0/255.0, alpha: 1)
        lbl4.font = UIFont.systemFontOfSize(11)
        lbl4.text = "$200"
        productView.addSubview(productImg)
        productView.addSubview(productImg)
        productView.addSubview(lbl1)
        productView.addSubview(lbl2)
        productView.addSubview(lbl3)
        productView.addSubview(lbl4)
        cartScroll.addSubview(productView)
    }
    
    func populateCart1(xValue :CGFloat) {
        var productView : UIView! = UIView(frame: CGRectMake(xValue, 22, 146, 198))
        var productImg : UIImageView! = UIImageView(frame: CGRectMake(0, 0, 146, 198))
        productImg.image = UIImage(named: "checkout-item2.png")
        var lbl1 : UILabel! = UILabel(frame: CGRectMake(8,145, 121, 16))
        lbl1.textColor = UIColor.whiteColor()
        lbl1.font = UIFont.systemFontOfSize(11)
        lbl1.text = "Piper Felt Hat"
        var lbl2 : UILabel! = UILabel(frame: CGRectMake(8, 157, 121, 16))
        lbl2.textColor = UIColor.whiteColor()
        lbl2.font = UIFont.systemFontOfSize(9)
        lbl2.text = "By Brixton"
        var lbl3 : UILabel! = UILabel(frame: CGRectMake(8, 173, 30, 16))
        lbl3.textColor = UIColor.whiteColor()
        lbl3.font = UIFont.systemFontOfSize(11)
        lbl3.text = "$210"
        var lbl4 : UILabel! = UILabel(frame: CGRectMake(40, 173, 30, 16))
        lbl4.textColor = UIColor(red: 0.0/255.0, green: 181.0/255.0, blue: 229.0/255.0, alpha: 1)
        lbl4.font = UIFont.systemFontOfSize(11)
        lbl4.text = "$200"
        productView.addSubview(productImg)
        productView.addSubview(productImg)
        productView.addSubview(lbl1)
        productView.addSubview(lbl2)
        productView.addSubview(lbl3)
        productView.addSubview(lbl4)
        cartScroll.addSubview(productView)
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
