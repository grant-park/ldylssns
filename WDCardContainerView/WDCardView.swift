//
//  WDCardView.swift
//  WDCardContainerView
//
//  Created by Winslow DiBona on 3/21/16.
//  Copyright © 2016 expandshare. All rights reserved.
//


import UIKit

class WDCardView: UIView {
    
    var orientation : UIDeviceOrientation!
    var hasAppeared : Bool = false
    var header: String?
    var body: String?
    var image: String?
    
    init(frame: CGRect, image: String?, header: String?, body: String?) {
        self.image = image
        self.header = header
        self.body = body
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        
//        // cardHeader
//        let cardHeader = UILabel(frame: CGRectMake(400,400,200,21))
//        cardHeader.center = CGPointMake(160, 284)
//        cardHeader.textAlignment = NSTextAlignment.Center
//        cardHeader.text = self.header
//        cardHeader.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(cardHeader)
//        
//        // cardBody
//        let cardBody = UILabel(frame: CGRectMake(500,500,300,21))
//        cardBody.center = CGPointMake(160, 284)
//        cardBody.textAlignment = NSTextAlignment.Center
//        cardBody.text = self.body
//        cardBody.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(cardBody)
        
        // cardImageView
        
//        UIGraphicsBeginImageContext(self.frame.size)
//        UIImage(named: "hurdlr.jpeg")?.drawInRect(self.bounds)
//        let subImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        self.backgroundColor = UIColor(patternImage: subImage)
        
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)
        self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        UIImage(named: image!)?.drawInRect(self.bounds)
        let subImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        self.backgroundColor = UIColor(patternImage: subImage)
        UIGraphicsEndImageContext()
        
        addDropShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func willAppear() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "rotated", name: UIDeviceOrientationDidChangeNotification, object: nil)
        rotated()
        hasAppeared = true
    }
    
    func appeared() {
        
    }
    
    func rotated() {
        let deviceOrientation = UIDevice.currentDevice().orientation
        if deviceOrientation == .FaceDown || deviceOrientation == .FaceUp {
            deviceOrientation.isLandscape ? (orientation = .LandscapeLeft) : (orientation = .Portrait)
        } else {
            orientation = deviceOrientation
        }
    }
    
    func dismissed() {
        
    }
    
    func addDropShadow() {
        let shadowPath = UIBezierPath(rect: self.bounds)
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSizeMake(0, 3)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowPath = shadowPath.CGPath
    }
    
    
    
}