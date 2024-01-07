//
//  UKHandlerFactory.swift
//  Movie
//
//  Created by Chard Xu on 2024/1/6.
//  Copyright © 2024 leting. All rights reserved.
//

import Foundation
import UKThreadSafeObjc

open class UKHandlerFactory {
    private let handlers: UKThreadSafeMutableDictionary<AnyObject, AnyObject> = UKThreadSafeMutableDictionary()

    static let shared = UKHandlerFactory()

    /// 添加
    public static func register(handler: Any?, protocol _protocol: Protocol?) {
        assert(handler != nil && _protocol != nil, "Handler or protocol for registering cannot be nil.")
        // WXAssertProtocol(handler, protocol)
        UKHandlerFactory.shared.handlers.setObject(handler, forKey: NSStringFromProtocol(_protocol!) as NSCopying)
    }

    /// 取单个值
    public static func handler(for _protocol: Protocol?) -> Any? {
        assert(_protocol != nil, "Cannot find handler for a nil protocol")
        return UKHandlerFactory.shared.handlers.object(forKey: NSStringFromProtocol(_protocol!))
    }

    /// 取所有值
    public static func handlerConfigs() -> NSDictionary {
        return UKHandlerFactory.shared.handlers
    }
}
