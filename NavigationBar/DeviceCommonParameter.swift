//
//  DeviceCommonParameter.swift
//  NavigationBar
//
//  Created by Superman on 2018/7/25.
//  Copyright © 2018年 Superman. All rights reserved.
//

import UIKit
@objc open class DeviceCommonParameter: NSObject {

    open static let ScreenBounds = UIScreen.main.bounds
    open static let ScreenWidth = DeviceCommonParameter.ScreenBounds.width
    open static let ScreenHeight = DeviceCommonParameter.ScreenBounds.height
    
    open static let ApplicationFrame = UIScreen.main.applicationFrame
    open static let ApplicationWidth = DeviceCommonParameter.ApplicationFrame.size.width
    open static let ApplicationHeight = DeviceCommonParameter.ApplicationFrame.size.height
    
    open static let NavigationBarHeight : CGFloat = 44
    open static let StatusBarHeight:CGFloat = 22.0
    
    open static let KeyboardHeight :CGFloat = 216
    open static let StatusBarSize = UIApplication.shared.statusBarFrame.size
}
