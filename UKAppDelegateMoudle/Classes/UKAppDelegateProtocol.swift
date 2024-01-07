//
//  AppDelegateProtocol.swift
//  Movie
//
//  Created by Chard Xu on 2024/1/6.
//  Copyright © 2024 leting. All rights reserved.
//

import UIKit

@objc public protocol UKAppDelegateProtocol where Self: UIApplicationDelegate {
    /// 启动时必须在主线程同步运行的库，优先执行
    @objc optional func syncMainApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)

    /// 启动时必须在主线程执行，可以延迟
    @objc optional func asyncMainApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)

    /// 启动时可以在全局并发队列执行
    @objc optional func asyncGlobalApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
}

// extension UKAppDelegateProtocol {
//    func syncMainApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {}
//
//    func asyncMainApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {}
//
//    func asyncGlobalApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {}
// }
