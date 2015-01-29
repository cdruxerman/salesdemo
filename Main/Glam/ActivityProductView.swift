//
//  ActivityProductView.swift
//  Glam
//
//  Created by Rajkumar Sharma on 29/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class ActivityProductView: UIView {

    var productImg : UIImageView!
    var label1 : UILabel!
    var label2 : UILabel!
    var label3 : UILabel!
    var btnAdd : UIButton!
    var btnProduct : UIButton!
    var productCurrent : Product!
    
    func createViewWithProduct(product : Product) {
        
        self.backgroundColor = UIColor.whiteColor()
        self.productCurrent = product
        var height: Float = 0.0;
        if (product.arrImg.count > 0) {
            var img : UIImage! = UIImage(named:product.arrImg.objectAtIndex(0) as NSString)
            height = Float(img.size.height * img.size.width / 150.0)
            productImg = UIImageView(frame: CGRectMake(0, 0, 150, CGFloat(height)))
            productImg.image = UIImage(named: product.arrImg.objectAtIndex(0) as NSString)
            productImg.contentMode = UIViewContentMode.ScaleToFill
            self.addSubview(productImg)
            btnProduct = UIButton(frame: productImg.frame)
            self.addSubview(btnProduct)
        }
        
        label1 = UILabel(frame: CGRectMake(4, CGFloat(height + 2), 140, 21))
        label2 = UILabel(frame: CGRectMake(4, CGFloat(height + 14), 140, 21))
        label3 = UILabel(frame: CGRectMake(4, CGFloat(height + 33), 70, 21))
        btnAdd = UIButton(frame: CGRectMake(95, CGFloat(height + 30), 45, 18))
        btnAdd.setImage(UIImage(named: "button-product-detail-add"), forState: UIControlState.Normal)
        
        self.label1.font = UIFont.systemFontOfSize(10)
        self.label2.font = UIFont.systemFontOfSize(10)
        self.label3.font = UIFont.systemFontOfSize(11)
        
        self.label1.text = product.productTitle
        self.label2.text = product.productCompany
        self.label3.text = product.productPrice
        self.label3.textColor = UIColor.lightGrayColor()
        self.label2.textColor = UIColor.lightGrayColor()
        
        self.addSubview(label1)
        self.addSubview(label2)
        self.addSubview(label3)
        self.addSubview(btnAdd)
        
    }
    
    func getHeightForView() -> Float {
        var height: Float = 0.0
        if (self.productCurrent.arrImg!.count > 0) {
            var img : UIImage! = UIImage(named:self.productCurrent.arrImg!.objectAtIndex(0) as NSString)
            height = Float(img.size.height * img.size.width / 150.0)
        }
        return height + 57
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
