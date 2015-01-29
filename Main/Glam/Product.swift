//
//  Product.swift
//  Glam
//
//  Created by Rajkumar Sharma on 29/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class Product: NSObject {
    
    var arrImg : NSArray!
    var productName : NSString!
    var productTitle : NSString!
    var productPrice : NSString!
    var productDescription : NSString!
    var productCompany : NSString!
    
    init(title : NSString, prodName name:NSString, prodPrice price:NSString, prodDesc desc:NSString, company prodCompany:NSString, images arrImgs:NSArray) {
        
        self.arrImg = arrImgs
        self.productName = name
        self.productTitle = title
        self.productPrice = price
        self.productDescription = desc
        self.productCompany = prodCompany
    }    
}
