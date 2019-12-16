# MDAd

**`MDAd.framework`** 用于 iOS 端移动应用广告展示. 基于 Swift 语言开发. 在使用广告服务的同时, 我们真诚希望收到大家的反馈. 

## 内容

- [环境支持](#环境支持)
- [集成方式](#集成方式)
- [初始化](#初始化)
- [广告样式](#广告样式)
- [常见问题](#常见问题)
- [错误码](#错误码)
- [版本日志](#版本日志)

## 环境支持

- **基于 Swift 5.0+ 语言开发.** 如需支持 Swift 低版本的 framework, 请联系我们.
- **支持 iOS 10.0+.**
- **支持 Xcode 11.0+.**

## 集成方式

1. **CocoaPods 集成**. 创建 `Podfile` 并指定其内容: 

   ```Ruby
   source 'https://github.com/CocoaPods/Specs.git'
   platform :ios, '10.0'
   use_frameworks!
   
   target '<Your Target Name>' do
       pod 'MDAd', '~> 0.7.0'
   end
   ```
   
   然后执行:
   
   ```bash
   $ pod install
   ```
 
2. **手动集成**. 请将仓库中 `MDAd.framework` 和 `MDAd.bundle` 手动拖入项目中. 在弹出的文件选项框中, 请勾选 `Copy items if needed`, 如图所示: 
	
   ![1](https://github.com/ruiyuad/MDAd/blob/master/linkImages/1.png)

	- 在 `target` -> `General` -> `Linked Frameworks and Libraries` 下删除 `MDAd.framework`, 然后在 `target` -> `General` -> `Embedded Binaries` 中添加 `MDAd.framework`. 这时也会自动在 `Linked Frameworks and Libraries` 目录下添加一份.
	 
	- 用法: 在使用 `MDAd.framework` 时, 在需要的文件头部 `import MDAd` 即可. 
	
	
     > NOTE: 如果你在 OC 项目中使用该 framework, 请在对应的 `target` -> `Build Settings` -> `ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES`     设置为 **YES**.
     

## 初始化

使用 `MDAd.framework` 前, 请先确认已注册 **AppKey** 和 **AppSecret**. 如有疑问, 请联系我们 *admin@mobiw.com* 或者当前 github 账号. 如已注册 **AppKey** 和 **AppSecret**, 请在 `application(_ application:, didFinishLaunchingWithOptions launchOptions:)` 做如下初始化:

```
RYAdMobCenter.center.setup("appKey", appSecret: "appSecret")
```
 
## 广告样式

**`MDAd.framework`** 提供六种广告样式, 分别是**横幅广告**、**信息流广告**、**开屏广告**、**插屏广告**、 **浮标广告**和**激励视频广告**. 并且对于每种广告, 支持开发者自定义广告样式.

### 横幅广告

**横幅广告**又称为 Banner. 通常展示在 App 页面的顶部或者底部. framework 中提供横幅广告样式有两种, 分别是**纯图模式** (宽高比为`640.0 : 60.0`) 和 **左图右文模式**(宽高比为`690.0 : 100.0`). 不同广告样式对应不同的 ID. 在使用该广告之前, 你需要申请横幅广告的广告 ID. 集成横幅广告的简单示例如下:

 1. 创建 `RYBannerView` 实例. `RYBannerView` 是 `MDAd.framework` 中用于展示横幅广告的视图类. 具体初始化代码如下:

    ```Swift
    /// bannerView 是 RYBannerView 类的实例
    /// 在 viewDidLoad(或者其他加载视图的时机) 中配置横幅广告 ID, 并且开始请求广告
    bannerView.adsID = "820001"
    bannerView.rootViewController = self
    bannerView.delegate = self
    bannerView.loadRequest()
    ```
 2. **RYBannerView** 提供广告请求成功或者失败的代理方法, 如果你在广告数据请求成功后显示广告视图, 你可以这样做:
	  
    - 实现广告数据成功获取代理方法: 

      ```Swift
      func adViewDidReceiveAd(_ bannerView: RYBannerView) {
		    // You can show infoFlowView with animation.
		    UIView.animate(withDuration: 1.0) {
		       self.bannerView.alpha = 1.0
		    }
      }
      ```
    - 实现广告数据成功获取代理方法: 
		
		```
		func bannerDidFailToReceiveAd(_ bannerView: RYBannerView, error: RYError) {}
		```
	    
 3. 详细代码请看 Demo 中 `BannerViewController` 类. 实现效果如下:
    
    ![3](https://github.com/ruiyuad/MDAd/blob/master/linkImages/3.PNG)

### 信息流广告

**信息流广告**用于展示在信息流列表中. 你可以使用 `RYInfoFlowView` 类来实现信息流广告的展示. framework 中提供横幅广告样式有三种, 分别是**纯图模式** (宽高比为`700.0 : 280.0`)、**左图右文模式** (宽高比为`690.0 : 290.0`) 和 **上文下图模式** (宽高比为`690.0 : 440.0`). 在使用该广告之前, 你需要申请信息流广告的广告 ID. 集成信息流广告的示例如下:

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
 
 2. **RYInfoFlowViewDelegate** 提供广告加载成功、失败等可选代理方法, 具体使用可查看 framework 中对应注释.

 3. 详细代码请看 Demo 中 `InfoFlowViewController` 类. 实现效果如下:
 
    ![4](https://github.com/ruiyuad/MDAd/blob/master/linkImages/4.PNG)
 
### 全屏广告

**全屏广告**又名插页式广告. 通常用于 App 启动或者从一个页面过渡到另一个页面的场景中. 你可以使用 **RYInterstitialView** 类来实现全屏广告的展示. framework 中提供全屏广告样式有两种, 分别是**纯图模式** (宽高比为`750 : 1334`) 和 **上图下文模式**(宽高比为`750.0 : 1143.0`). 其中后者提供对不同屏幕适配方案. 在使用该广告之前, 你需要申请全屏广告的广告 ID. 集成全屏广告的简单示例如下:

 1. 创建 **RYInterstitialView** 实例. **RYInterstitialView** 是 `MDAd.framework` 中用于展示全屏广告的视图类. 具体初始化代码如下:
 
    ```Swift
    /// 插页式广告展示宽高比是 750.0 : 1334.0
    /// interstitialView 是 RYInterstitialView 类的实例
    interstitialView.adsID = "810001"
    interstitialView.rootViewController = self
    interstitialView.delegate = self
    interstitialView.loadRequest()
    ```
 
 2. **RYInterstitialViewDelegate** 提供广告加载成功、失败等可选代理方法, 具体使用可查看 framework 中对应注释.

 3. 详细代码请看 Demo 中 `InterstitialViewController` 类. 实现效果如下:
    
    ![5](https://github.com/ruiyuad/MDAd/blob/master/linkImages/5.PNG)

### 插屏广告

**插屏广告**用于展示插屏广告. 通常用于 App 屏幕中间展示. 你可以使用 **RYInterstitialHalfView** 类来实现插屏广告的展示. framework 中提供插屏广告尺寸宽高比为 `510 : 510`. 在使用该广告之前, 你需要申请插屏广告的广告 ID. 集成插屏广告的简单示例如下:

 1. 创建 **RYInterstitialHalfView** 实例. **RYInterstitialHalfView** 是 `MDAd.framework` 中用于展示插屏广告的视图类. 具体初始化代码如下:
 
    ```Swift
    /// 插屏式广告位展示宽高值推荐为 255.0 * (255.0 + 55.0), 为保证底部 Close 按钮正常显示, 请保证高度始终大于宽度 55.0
    halfInterstitialView.adsID = "840001"
    halfInterstitialView.rootViewController = self
    halfInterstitialView.delegate = self
    halfInterstitialView.loadRequest()
    ```
 
 3. **RYInterstitialHalfViewDelegate** 提供广告加载成功、失败等可选代理方法, 具体使用可查看 framework 中对应注释.

 4. 详细代码请看 Demo 中 `InterstitialHalfViewController` 类. 实现效果如下:
    
    ![6](https://github.com/ruiyuad/MDAd/blob/master/linkImages/6.PNG)

### 浮标广告

**浮标广告**通常展示在页面的边角位置. 是五种广告中展示面积最小的一种. 支持 Gif 效果. 你可以使用 **RYBuoyView** 类来实现浮标广告的展示. framework 中提供浮标广告尺寸宽高比为 `110 : 110`. 在使用该广告之前, 你需要申请浮标广告的广告 ID. 集成浮标广告的示例如下:

 1. 创建 **RYBuoyView** 实例. **RYBuoyView** 是 `MDAd.framework` 中用于展示浮标广告的视图类. 具体初始化代码如下:

    ```Swift
    /// 浮标式广告展示宽高比是 110 : 110
    /// buoyView 是 RYBuoyView 类的实例
    buoyView.adsID = "860001"
    buoyView.rootViewController = self
    buoyView.delegate = self
    buoyView.loadRequest()
    ```
 
 2. **RYBuoyViewDelegate** 提供广告加载成功、失败等可选代理方法, 具体使用可查看 framework 中对应注释.

 3. 详细代码请看 Demo 中 `BuoyViewController` 类. 实现效果如下:
    
    ![7](https://github.com/ruiyuad/MDAd/blob/master/linkImages/7.PNG)
    
### 激励视频广告

**激励视频广告**属于视频类广告. 你可以使用 **RYRewardVideoViewController** 类来实现激励视频广告的展示. 在使用该广告之前, 你需要申请激励视频广告的 ID. 集成激励视频广告的示例如下:

 1. 创建 **RYRewardVideoViewController** 实例. **RYRewardVideoViewController** 是 `MDAd.framework` 中用于展示激励视频广告的控制器类. 具体初始化代码如下:

    ```Swift
    /// 不要全局持有 `RYRewardVideoViewController`的实例, 每个实例管理一次完整的视频加载生命周期.
    let rewardVideoVC = RYRewardVideoViewController()
    rewardVideoVC.adsID = "870001"
    rewardVideoVC.delegate = self
    rewardVideoVC.loadRequest()
    present(rewardVideoVC, animated: true, completion: nil)
    ```
 
 2. **RYRewardVideoViewControllerDelegate** 提供广告加载成功、失败等可选代理方法, 具体使用可查看 framework 中对应注释.

 3. 详细演示代码请看 Demo 中 `RewardVideoViewController` 类.
    
    ![8](https://github.com/ruiyuad/MDAd/blob/master/linkImages/8.png)

### 自定义广告

**自定义广告**不是某一类广告. MDAd.framework 提供多种通用的广告类型, 对于需要 UI 定制化的广告展示, framework 提供自定义类型, 开放广告展示所需的数据源给开发者, 用于 UI 定制化. 集成自定义广告的示例如下:

 1. 创建 **RYCustomAd** 实例. **RYCustomAd** 是 `MDAd.framework` 中用于自定义广告的工具类. 具体初始化代码如下:

    ```Swift
    /// 这里以 850008 广告位进行自定义展示
    /// 自定义广告对应的广告图片的比例. 注意: 在进行自定义广告时, 请务必保证自定义图片的比例与对应广告类型图片比例保持一致.
    self.customAd = RYCustomAd(adsID: "850008")
    customAd.rootViewController = self
    customAd.delegate = self
    customAd.loadRequest()
    ```
 2. 自定义广告源在请求成功后返回. 返回类型是 [String: String]. 其中Key值分别是

 	- **MDAdKeyForImageUrl**: 广告图片展示地址
 	- **MDAdKeyForTitle**: 广告标题
 	- **MDAdKeyForDescription**: 广告描述

 	具体代码如下:
 	
 	```Swift
 	func customAdDidReceiveAd(_ customAd: RYCustomAd, receivedData infos: [String : String]) {
 		 // customView 是开发者自定义视图, 用于定制展示广告数据
        customView.update(infos["MDAdKeyForImageUrl"],
                          title: infos["MDAdKeyForTitle"],
                          desc: infos["MDAdKeyForDescription"],
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
 	
 4. 详细演示代码请看 Demo 中 `RYCustomAd` 类.

## 常见问题

Q: 支持OC项目接入吗?     
A: 支持. 该SDK使用 Swift 开发, 对 OC 项目做了全面的支持.

Q: 为什么有时广告代理方法均未执行?    
A: 出现此现象一般是两个原因导致:

 1. 检查 **appKey** 和 **appSecret** 配置. 一般在 **AppDelegate 中 didFinishLaunchingWithOptions** 配置; 
 2. 错误初始化对应广告基类实例为局部变量. 请务必在页面展示周期内持有对应的广告实例变量.
  
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

 1. 40006 是当前广告位已经关闭. 该错误一般发生后台重复配置删除同一广告位, 进行广告展示前, 请确定对应的广告位是否开启. 
 2. 50001 表示当前广告位广告无法提供. 
 
## 错误码

对于接入过程中的错误码详情, 请查看错误码文档: [错误码](https://github.com/ruiyuad/MDAd/blob/master/常见错误码.md)

## 版本日志

0.1.0: 接入五种常用广告.   
0.2.0: 修改 SDK 命名规范.   
0.3.0: 新增横幅广告**左图右文**样式, 信息流广告**左图右文**、**上文下图**样式. 横幅、信息流、开屏、插屏和浮标广告位纯图模式广告改版.     
0.3.1: 修复`加载左图右文格式广告位时, 左图在第三方 App 内显示不完整` bug.      
0.3.2: 更改浮标广告位背景色为透明色.   
0.4.0: 新增信息流广告**上图下文**样式, **浮层**样式, **左图右文**样式新增 1:1.3图片比例;新增应用内打开广告方式;**浮标**广告支持 Gif.    
0.4.1: 修复自定义广告类型中 **adsID** 在 OC 项目中的可访问性.      
0.4.2: 调整广告标题和副标题长度为 50 位.     
0.5.0: 新增**激励视频**广告.     
0.6.0: 新增全屏广告**上图下文样式**.        
0.6.1: 修复 tag 0.6.0 未链接对应 MDAd.framework 和 MDAd.bundle.       
0.7.0: 新增激励视频广告背景样式.       

