//
//  UINavigationBarExtention.swift
//  NavigationBar
//
//  Created by Superman on 2018/7/25.
//  Copyright © 2018年 Superman. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    
    fileprivate struct AssociatedKeys{
        
        static var DescriptiveName = "CustomNavigationBar"
    }
    
    var overlayer : UIView? {
        get {
            let anyObj = objc_getAssociatedObject(self, &AssociatedKeys.DescriptiveName)
            return anyObj as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.DescriptiveName, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func setCustomBackgroundColor(_ color:UIColor)  {
        if self.overlayer == nil {
            self.setBackgroundImage(UIImage.init(), for: UIBarMetrics.default)
            self.shadowImage = UIImage.init()
            
            self.overlayer = UIView.init(frame:CGRect(x: 0, y: -DeviceCommonParameter.StatusBarHeight, width: DeviceCommonParameter.ScreenWidth, height: DeviceCommonParameter.StatusBarHeight+DeviceCommonParameter.NavigationBarHeight))
            self.overlayer?.isUserInteractionEnabled = false
            self.overlayer?.autoresizingMask = [UIViewAutoresizing.flexibleWidth,UIViewAutoresizing.flexibleHeight]
            self.insertSubview(self.overlayer!, at: 0)
            
        }
        self.overlayer?.backgroundColor = color
    }
    
    
    
}


























