# MDAdSDK

**`MDAd.framework`** 用于 iOS 端移动应用广告展示. 基于 Swift 语言开发. 在使用广告服务的同时, 我们真诚希望收到大家的反馈. 如有疑问, 请联系我们 *admin@mobiw.com* 或者当前 github 账号.

## 目录
- [环境支持](#环境支持)
- [集成方式](#集成方式)
- [项目配置](#项目配置)
- [初始化](#初始化)
- [广告样式](#广告样式)
- [常见问题](#常见问题)
- [错误码](#错误码)
- [版本更新日志](#版本更新日志)

## 环境支持

- **基于 Swift 5.0+ 语言开发.** 如需支持 Swift 低版本的 framework, 请联系我们.
- **支持 iOS 10.0+.**
- **支持 Xcode 11.0+.**

## 集成方式

### 手动集成
请将 `MDAd.framework` 和 `MDAd.bundle` 手动拖入项目中. 在弹出的文件选项框中, 请勾选 `Copy items if needed`, 如图所示: 
 ![1](https://github.com/ruiyuad/MDAd/blob/master/linkImages/1.png)
 - 用法: 在使用 `MDAd.framework` 时, 在需要的文件头部 `import MDAd` 即可. 
 - 如集成出现错误, 在 `target` -> `General` -> `Linked Frameworks and Libraries` 下删除 `MDAd.framework`, 然后在 `target` -> `General` -> `Embedded Binaries` 中添加 `MDAd.framework`. 这时也会自动在 `Linked Frameworks and Libraries` 目录下添加一份.

### Cocoapods集成
在 `Podfile`中添加:
   ```Ruby
   
   target '<Your Target Name>' do
   pod 'MDAdSDK', '~> 0.9.0'
   end
   ```
然后执行:
   ```bash
   $ pod install
   ```

 > NOTE: 如果您在 OC 项目中使用该 framework, 请在对应的 `target` -> `Build Settings` -> `ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES`  设置为 **YES**.

## 项目配置

每个广告对应的链接内容会由广告主配置, 这些链接内容会存在 `http` urls 的情况. 为了尽可能显示广告链接内容, 推荐项目设置中打开对 `http` 的支持, 在`Info.plist`文件中添加如下内容:
```XML
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

## SDK初始化
使用 `MDAd.framework` 前, 请先确认已成功在平台注册 **AppKey** 和 **AppSecret**. 如已注册 **AppKey** 和 **AppSecret**, 请在您项目AppDelegate文件的 `application(_ application:, didFinishLaunchingWithOptions launchOptions:)` 做如下初始化:
```
RYAdMobCenter.center.setup("appKey", appSecret: "appSecret")
```

## 广告样式

**`MDAd.framework`** 提供五种广告类型, 分别是**Banner广告**、**信息流广告**、**开屏广告**、**插屏广告**、**浮标广告**. 对于每种广告类型, 都支持用户自定义样式，在使用这些广告之前, 您需要申请对应广告的ID, 开通对应广告权限后方可正常获取广告数据. 如需要查看完整广告效果，建议下载对应Demo查看.

### Banner广告 
>支持广告位如下(比列为广告位比例)

| ID | 类型 | 广告位尺寸 |
| :-: | :-: | :-: |
| 820001 | 单图10.67 | 640 : 60 |
| 820004 | 左图右文1.56 | 690 : 100 |
| 820005 | 单图4.26 | 690 : 150 |

![Banner广告](https://github.com/ruiyuad/MDAd/blob/master/linkImages/3.PNG)

通常展示在 App 页面的顶部或者底部, 集成Banner广告的简单示例如下:

 1. 创建 `RYBannerView` 实例, `RYBannerView` 是 `MDAd.framework` 中用于展示横幅广告的视图类. 

    ```Swift
    /// bannerView 是 RYBannerView 类的实例
    /// 在 viewDidLoad(或者其他加载视图的时机) 中配置Banner广告 ID, 并且开始请求广告
    bannerView.adsID = "820001"
    bannerView.rootViewController = self
    bannerView.delegate = self
    bannerView.loadRequest()
    ```
 2. **RYBannerViewDelegate** 提供广告加载成功、失败等可选代理方法.
    ```
    bannerDidReceiveAd(_ bannerView: RYBannerView)
    bannerDidFailToReceiveAd(_ bannerView: RYBannerView, error: RYError)
    bannerWillLeaveApplication(_ bannerView: RYBannerView)
    bannerViewDidClose()
    ```

### 信息流广告
>支持广告位如下(比列为广告位比例)

| ID | 类型 | 广告位尺寸 |
| :-: | :-: | :-: |
| 850002 | 左图右文0.67 | 690 : 290 |
| 850006 | 上文下图1.78 | 690 : 440 |
| 850007 | 左文右图0.78 | 690 : 290 |
| 850008 | 左图右文0.78 | 690 : 290 |
| 850009 | 上图下文1.78 | 690 : 440 |
| 850010 | 左图右文1.5 | 690 : 168 |
| 850011 | 左文右图1.5 | 690 : 168 |

![信息流广告](https://github.com/ruiyuad/MDAd/blob/master/linkImages/4.PNG)

通常展示在信息流列表的某个位置, 您可以使用 `RYInfoFlowView` 类来实现信息流广告的展示:

 1. 创建 `RYInfoFlowView ` 实例. `RYInfoFlowView ` 是 `MDAd.framework` 中用于展示信息流广告的视图类. 具体初始化代码如下:
 
    ```Swift
    /// infoFlowView 是 RYInfoFlowView 类的实例
    /// 左图右文模式, adsID 为 850002
    /// 广告位尺寸是 690.0 : 290.0, 广告图片比例是 576: 386(请初始化 infoFlowView 初始宽高比为 690.0 : 290.0), 请在初始化是正确设置 infoFlowView 的比例为 690.0 : 290.0
    infoFlowView.adsID = "850002"
    infoFlowView.rootViewController = self
    infoFlowView.delegate = self
    infoFlowView.loadRequest()
    ```
 
 2. **RYInfoFlowViewDelegate** 提供广告加载成功、失败等可选代理方法.
    ```
    infoFlowDidReceiveAd(_ infoFlowView: RYInfoFlowView)
    infoFlowDidFailToReceiveAd(_ infoFlowView: RYInfoFlowView, error: RYError)
    infoFlowWillLeaveApplication(_ infoFlowView: RYInfoFlowView)
    infoFlowViewDidClose()
    ```

### 开屏广告
>支持广告位如下(比列为广告位比例)

| ID | 类型 | 广告位尺寸 |
| :-: | :-: | :-: |
| 810001 | 单图0.56 | 750 : 1334 |
| 810002 | 上图下logo | 750 : 1334 |

- **810002**logo部分的高度为机器屏幕宽度的1/3

 ![开屏广告](https://github.com/ruiyuad/MDAd/blob/master/linkImages/5.PNG) 

通常用于 App 启动或者从一个页面过渡到另一个页面的场景中, 您可以使用 **RYInterstitialView** 类来实现全屏广告的展示:

 1. 创建 **RYInterstitialView** 实例. **RYInterstitialView** 是 `MDAd.framework` 中用于展示全屏广告的视图类. 具体初始化代码如下:
 
    ```Swift
    /// 插页式广告展示宽高比是 750.0 : 1334.0
    /// interstitialView 是 RYInterstitialView 类的实例
    interstitialView.adsID = "810001"
    interstitialView.rootViewController = self
    interstitialView.delegate = self
    interstitialView.loadRequest()
    ```
   
    - **上图下Logo模式**不仅显示开屏广告图, 而且可以在底部融入 App 元素如 App logo, App 名称等.
        
     ```Swift
    /// Only works for interstitial ad which adsID is 810002.
       interstitialView.bottomLogoView = bottomLogoView
    ```
 
 2. **RYInterstitialViewDelegate** 提供广告加载成功、失败等可选代理方法.
    ```
    interstitialDidReceiveAd(_ interstitial: RYInterstitialView)
    interstitialDidFailToReceiveAd(_ interstitial: RYInterstitialView, error: RYError)
    interstitialWillLeaveApplication(_ interstitial: RYInterstitialView)
    interstitialCountDownDidTap()
    ```

### 插屏广告
>支持广告位如下(比列为广告位比例)

| ID | 类型 | 广告位尺寸 |
| :-: | :-: | :-: |
| 840001 | 插屏 | 510 : 510 |

![插屏广告](https://github.com/ruiyuad/MDAd/blob/master/linkImages/6.PNG) 

通常用于 App 屏幕中间展示, 您可以使用 **RYInterstitialHalfView** 类来实现插屏广告的展示: 

 1. 创建 **RYInterstitialHalfView** 实例. **RYInterstitialHalfView** 是 `MDAd.framework` 中用于展示插屏广告的视图类. 具体初始化代码如下:
 
    ```Swift
    /// 插屏式广告位展示宽高值推荐为 255.0 * (255.0 + 55.0), 为保证底部 Close 按钮正常显示, 请保证高度始终大于宽度 55.0
    halfInterstitialView.adsID = "840001"
    halfInterstitialView.rootViewController = self
    halfInterstitialView.delegate = self
    halfInterstitialView.loadRequest()
    ```
 
 3. **RYInterstitialHalfViewDelegate** 提供广告加载成功、失败等可选代理方法.
     ```
     interstitialHalfDidReceiveAd(_ interstitial: RYInterstitialHalfView)
     interstitialHalfDidFailToReceiveAd(_ interstitial: RYInterstitialHalfView, error: RYError)
     interstitialHalfWillLeaveApplication(_ interstitial: RYInterstitialHalfView)
     interstitialHalfViewDidClose()
     ```

### 浮标广告
>支持广告位如下(比列为广告位比例)

| ID | 类型 | 广告位尺寸 |
| :-: | :-: | :-: |
| 860001 | 浮标 | 110 : 110 |

![浮标广告](https://github.com/ruiyuad/MDAd/blob/master/linkImages/7.PNG)

通常展示在页面的边角位置, 是所有广告类型中展示面积最小的一种, 支持 Gif 效果. 您可以使用 **RYBuoyView** 类来实现浮标广告的展示:

 1. 创建 **RYBuoyView** 实例. **RYBuoyView** 是 `MDAd.framework` 中用于展示浮标广告的视图类. 具体初始化代码如下:

    ```Swift
    /// 浮标式广告展示宽高比是 110 : 110
    /// buoyView 是 RYBuoyView 类的实例
    buoyView.adsID = "860001"
    buoyView.rootViewController = self
    buoyView.delegate = self
    buoyView.loadRequest()
    ```
 2. **RYBuoyViewDelegate** 提供广告加载成功、失败等可选代理方法.
     ```
     buoyDidReceiveAd(_ buoyView: RYBuoyView)
     buoyDidFailToReceiveAd(_ buoyView: RYBuoyView, error: RYError)
     buoyWillLeaveApplication(_ buoyView: RYBuoyView)
     buoyViewDidClose()
     ```

### 自定义广告

提供广告数据源供开发者自定义广告样式, MDAd.framework 提供多种通用的广告类型, 对于需要 UI 定制化的广告展示, framework 开放广告展示所需的数据源给开发者, 用于 UI 定制化. 集成自定义广告的示例如下:

 1. 创建 **RYCustomAd** 实例. **RYCustomAd** 是 `MDAd.framework` 中用于自定义广告的工具类. 具体初始化代码如下:

    ```Swift
    /// 这里以 850008 广告位进行自定义展示
    /// 自定义广告对应的广告图片的比例. 注意: 在进行自定义广告时, 请务必保证自定义图片的比例与对应广告类型图片比例保持一致.
    self.customAd = RYCustomAd(adsID: "850008")
    customAd.rootViewController = self
    customAd.delegate = self
    customAd.loadRequest()
    ```
 2. 自定义广告源在请求成功后返回. 使用 **RYCustomAdItem** 类来获取广告数据.  具体代码如下:
    
    ```Swift
    func customAdDidReceiveAd(_ customAd: RYCustomAd, receivedData item: RYCustomAdItem) {
         // customView 是开发者自定义视图, 用于定制展示广告数据
        customView.update(item.imageUrls?.first ?? "",
                          title: item.title,
                          desc: item.desc,
                          imageRatio: imageViewRatioForCustomAd)
    }
    ```
 3. 实现跟通用广告相同的广告跳转效果:

    ```Swift
    /// adTapped 是开发者自定义视图上的手势点击行为
    func adTapped() {
        // open ad link.
        // called when you add gestures, actions or other Selectors to you custom ad view
        customAd.openAdLink()
    }
    ```

## 常见问题

Q: 支持OC项目接入吗?     
A: 支持. 该SDK使用 Swift 开发, 对 OC 项目做了全面的支持.

Q: 为什么有时广告代理方法均未执行?    
A: 出现此现象一般是两个原因导致:

 1. 检查 **appKey** 和 **appSecret** 配置. 一般在 **AppDelegate 中 didFinishLaunchingWithOptions** 配置; 
 2. 错误初始化对应广告基类实例为局部变量, 请务必在页面展示周期内持有对应的广告实例变量.
  
Q: 加载广告为什么不显示?     
A: 请检查对应广告 ID 是否正确.

Q: 为什么出现部分广告点击后没有发生跳转?    
A: **rootViewController** 未设置. rootViewController 用来弹出落地页或者执行广告跳转操作.

Q: 手动集成时为什么会发生 `image not found`?    
A: 该错误一般发生在 OC 项目中接入 MDAd.framework. 确定 MDAd.bundle 已经导入, 可在 `target` -> `Build Phases` -> `Copy Bundle Resources` 查看是否存在. 确保 `MDAd.framework` 和 `MDAd.bundle` 同时存在项目中. 确保 OC 项目中 `ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES` 选项设置为 YES.

Q: 广告样式是否可以自定义?     
A: 可以. 开发者只需传入需要自定义广告的 ID, 即可获取该广告的图片、标题和广告描述来实现广告UI的自定义. 具体请使用 **RYCustomAd** 类来实现此功能.

Q: 请问有OC版本的Demo吗?     
A: 有的. 文档以 Swift 代码演示, 如果你正在使用 Objective-C 语言开发, 可查看仓库中 OC 示例工程 **OCMDAdDemo**.

Q: 接入时出现了 40006, 50001 错误返回. 请问这是什么错误?    
A: 下面分别介绍两个错误码含义:

 1. 40006 是当前广告位已经关闭.  
 2. 50001 表示当前广告位广告无法提供. 
 
## 错误码

对于接入过程中的错误码详情, 请查看错误码文档: [错误码](https://github.com/ruiyuad/MDAd/blob/master/常见错误码.md)

## 版本更新日志

0.9.0: 新增部分广告位，支持Deeplink跳转.    
0.8.10: 优化初始化逻辑.    
0.8.9: 互动广告内部支持 Apple Store 应用内打开方式.    
0.8.8: 增加互动广告展示.    
0.8.7: 新增 webView 链接广告样式.   
0.8.6: 优化内部广告展示.    
0.8.5: 优化广告显示效果.    
0.8.4: 更改 bundle 版本号为 `0.8.3.1` 不能打包上传问题.   
0.8.3.1: 注释修正.  
0.8.3: 自定义广告增加点击和曝光支持.  
0.8.2: 自定义广告返回数据使用 **RYCustomAdItem** 类来代替键值对返回.    
0.8.1: 优化视频播放.  
0.8.0: 新增信息流广告**三图样式**.     
0.7.2: 视频预加载优化、开屏广告提供广告链接应用外打开方式及其他细节优化.       
0.7.1: 修复场景: 当全屏广告所在视图被 keyWindow 覆盖时, 广告点击视图无法显示问题.    
0.7.0: 新增激励视频广告背景样式.    
0.6.1: 修复 tag 0.6.0 未链接对应 MDAd.framework 和 MDAd.bundle.    
0.6.0: 新增全屏广告**上图下文样式**.    
0.5.0: 新增**激励视频**广告.    
0.4.2: 调整广告标题和副标题长度为 50 位.  
0.4.1: 修复自定义广告类型中 **adsID** 在 OC 项目中的可访问性.  
0.4.0: 新增信息流广告**上图下文**样式, **浮层**样式, **左图右文**样式新增 1:1.3图片比例;新增应用内打开广告方式;**浮标**广告支持 Gif.  
0.3.2: 更改浮标广告位背景色为透明色.  
0.3.1: 修复`加载左图右文格式广告位时, 左图在第三方 App 内显示不完整` bug.        
0.3.0: 新增横幅广告**左图右文**样式, 信息流广告**左图右文**、**上文下图**样式. 横幅、信息流、开屏、插屏和浮标广告位纯图模式广告改版.  
0.2.0: 修改 SDK 命名规范.      
0.1.0: 接入五种常用广告.    
