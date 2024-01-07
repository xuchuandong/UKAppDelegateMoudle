# 三方库和AppDelegate交互封装


## Example

```
// AppDelegate
import UKAppDelegateMoudle

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    override init() {
        AppDelegate.setuAppHandler()
        super.init()
    }
    
    class func setuAppHandler() {
        UKHandlerFactory.register(handler: UKAppDelegateHandler.shared, protocol: UKAppDelegateProtocol.self)
        UKAppDelegateHandler.shared.setUp(thirdLib: UKJiguangHandler())
    }
    
    static let appDelegateHandler: UKAppDelegateProtocol = {
        let handler = UKHandlerFactory.handler(for: UKAppDelegateProtocol.self) as! UKAppDelegateProtocol
        return handler
    }()
    

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
        return AppDelegate.appDelegateHandler.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        AppDelegate.appDelegateHandler.applicationWillResignActive?(application)
    }
}
```

```
// Handler
import UKAppDelegateMoudle

class UKJiguangHandler: NSObject, UKAppDelegateProtocol {
    func syncMainApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        initJiguangSync()
    }

    func asyncMainApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        initJiguangAsync()
    }
}

// UKAppDelegateProtocol
extension UKJiguangHandler {
    

}

// AppDelegate
extension UKJiguangHandler {
    func applicationWillResignActive(_ application: UIApplication) {
        print("")
    }
}
```

## Requirements

## Installation

UKAppDelegateMoudle is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'UKAppDelegateMoudle'
```

## Author

chardxu, 1007034110@qq.com

## License

UKAppDelegateMoudle is available under the MIT license. See the LICENSE file for more info.
