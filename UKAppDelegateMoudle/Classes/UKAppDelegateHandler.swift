//
//  AppDelegateHandler.swift
//  Movie
//
//  Created by Chard Xu on 2024/1/6.
//  Copyright © 2024 leting. All rights reserved.
//

import UIKit

/// 开始时间
private var time1: CFAbsoluteTime = 0

/// 三方库处理
open class UKAppDelegateHandler: NSObject {
    override private init() {
        time1 = CFAbsoluteTimeGetCurrent()
        super.init()
    }

    /// 三方库数组
    private var thirdLibArr: [UKAppDelegateProtocol] = []

    /// 计算耗时
    private func culculateTimeConsuming(obj: AnyObject, methodName: String) {
        print("当前运行的是=>\(String(describing: type(of: obj)))----------function=>\(methodName)")
        let time2 = CFAbsoluteTimeGetCurrent()
        print("time count=>\(String(describing: type(of: obj)))----------=>\(time2 - time1)")
    }
}

// MARK: - AppDelegate

extension UKAppDelegateHandler {
    func applicationWillResignActive(_ application: UIApplication) {
        for obj in thirdLibArr {
            obj.applicationWillResignActive?(application)
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        syncMainApplication(application, didFinishLaunchingWithOptions: launchOptions)
        asyncMainApplication(application, didFinishLaunchingWithOptions: launchOptions)
        asyncGlobalApplication(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        for obj in thirdLibArr {
            obj.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        }
    }

    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable: Any], completionHandler: @escaping () -> Void) {
        for obj in thirdLibArr {
            if #available(iOS 10.0, *) {
            } else {
                obj.application?(application, handleActionWithIdentifier: identifier, forRemoteNotification: userInfo, completionHandler: completionHandler)
            }
        }
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        for obj in thirdLibArr {
            if obj.application?(application, continue: userActivity, restorationHandler: restorationHandler) ?? false {
                return true
            }
        }
        return false
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        print("open url scheme\(url.absoluteString)")
        for obj in thirdLibArr {
            if obj.application?(app, open: url, options: options) ?? false {
                return true
            }
        }
        return false
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        for obj in thirdLibArr {
            obj.application?(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        for obj in thirdLibArr {
            obj.applicationDidEnterBackground?(application)
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        for obj in thirdLibArr {
            obj.applicationWillEnterForeground?(application)
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        for obj in thirdLibArr {
            obj.applicationWillTerminate?(application)
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        for obj in thirdLibArr {
            obj.applicationDidBecomeActive?(application)
        }
    }
}

// MARK: - After didFinishLaunchingWithOptions

extension UKAppDelegateHandler: UKAppDelegateProtocol {
    private func syncMainApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        for obj in thirdLibArr {
            obj.syncMainApplication?(application, didFinishLaunchingWithOptions: launchOptions)
        }
    }

    private func asyncMainApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        DispatchQueue.main.async {
            for obj in self.thirdLibArr {
                obj.asyncMainApplication?(application, didFinishLaunchingWithOptions: launchOptions)
            }
        }
    }

    private func asyncGlobalApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        DispatchQueue.global().async {
            for obj in self.thirdLibArr {
                obj.asyncGlobalApplication?(application, didFinishLaunchingWithOptions: launchOptions)
            }
        }
    }
}

// MARK: - Public

extension UKAppDelegateHandler {
    /// 单例
    public static let shared = UKAppDelegateHandler()
    /// 添加三方库
    public func setUp(thirdLib obj: UKAppDelegateProtocol) {
        thirdLibArr.append(obj)
    }
}
