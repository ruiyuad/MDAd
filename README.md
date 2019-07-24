# RYAds

**`RuiYuAdMob.framework`** 用于 iOS 端展示常见移动应用广告. 基于 Swift 语言开发. 在使用广告服务的同时, 我们真诚希望收到大家的反馈. 


## 环境支持

- **基于 Swift 5.0 语言开发.** 如需支持 Swift 低版本的 framework, 请联系我们.
- **最低系统支持 iOS 10.0.**

## 集成方式

1. **手动集成**. 请将仓库中 `RuiYuAdMob.framework` 和 `RuiYuAdMob.bundle` 手动拖入项目中. 在弹出的文件选项框中, 请勾选 `Copy items if needed`, 如图所示: (图一)
	
	 - 在 `target` -> `General` -> `Embedded Binaries` 中点击坐下角 `+`, 选择 `RuiYuAdMob.framework`, 添加. 这时也会自动在 `Linked Frameworks and Libraries` 目录下添加一份. (图二)
	 - 使用用法: 在使用 `RuiYuAdMob.framework` 时, 在需要的文件头部 `import RuiYuAdMob` 即可. 

2. **通过 CocoaPods 集成 (稍后集成)**

## 五种广告样式

**`RuiYuAdMob.framework`** 提供五种广告样式, 分别是 **横幅广告**、**信息流广告**、**开屏广告**、**插屏广告** 和 **浮标广告**.

### 横幅广告

**横幅广告** 又称为 Banner. 通常展示在 App 页面的顶部或者底部. framework 中提供横幅广告尺寸宽高比为 `700 : 280`. 在使用该广告之前, 你需要申请横幅广告的广告 ID. 集成横幅广告的简单示例如下:

 1. 便于展示, 我们采用 Interface Builder 来构建视图. 我们拖入一个 View 视图, 取名为 bannerView, 并选择继承自 `RYBannerView`. `RYBannerView` 是 `RuiYuAdMob.framework` 中用于展示横幅广告的视图类.
 	
 	```Swift
 	@IBOutlet weak var bannerView: RYBannerView!
 	```

 2. 在 `viewDidLoad`(或者其他加载视图的时机) 中配置横幅广告 ID, 并且开始请求广告, 示例代码如下:

    ```Swift
    // 1. Required step1: configs AdsID
    bannerView.adsID = "横幅广告ID"

    // 2. Required step2: load request
    bannerView.loadRequest()
    ```
 3. **RYBannerView** 提供广告请求成功或者失败的代理方法, 如果你在广告数据请求成功后显示广告视图, 你可以这样做:
  
    - 设置代理给当前控制器:
  
      ```Swift
      bannerView.delegate = self
      ```
	  
    - 实现广告数据成功获取代理方法: 

      ```Swift
      func adViewDidReceiveAd(_ bannerView: RYBannerView) {
	  // You can show infoFlowView with animation.
	  // 你可以在收到横幅广告后, 在这里使用动画来展示它
	  UIView.animate(withDuration: 1.0) {
	      self.bannerView.alpha = 1.0
	  }
      }
      ```
	    
 4. 详细代码请看 Demo 中 `BannerViewController` 类. 实现效果如下: (图三)


### 信息流广告

**信息流广告** 用于展示在信息流列表中. 你可以使用 `RYInfoFlowView` 类来实现信息流广告的展示. framework 中提供信息流广告尺寸宽高比为 `700 : 280`. 在使用该广告之前, 你需要申请信息流广告的广告 ID. 集成信息流广告的简单示例如下:

 1. 创建 `RYInfoFlowView` 实例:
 	
    ```Swift
    @IBOutlet weak var infoFlowView: RYInfoFlowView!
    ```
 	
 2. 在 `viewDidLoad`(或者其他加载视图的时机) 中配置信息流广告 ID, 并且开始请求广告, 示例代码如下:
 
    ```Swift
    // 1. Required step1: configs `AdsID`
    infoFlowView.adsID = "信息流广告ID"
    
    // 2. Required step2: load request
    infoFlowView.loadRequest()
    ```
 
 3. **RYInfoFlowViewDelegate** 提供广告加载成功、失败等可选代理方法, 具体使用可查看 framework 中对应注释.

 4. 详细代码请看 Demo 中 `InfoFlowViewController` 类. 实现效果如下: (图四)
 

### 开屏广告

**开屏广告** 用于展示全屏广告. 通常用于 App 启动或者用一个页面过渡到另一个页面的场景中. 你可以使用 `RYInterstitialView` 类来实现开屏广告的展示. framework 中提供开屏广告尺寸宽高比为 `750 : 1334`. 在使用该广告之前, 你需要申请开屏广告的广告 ID. 集成开频广告的简单示例如下:

 1. 创建 `RYInterstitialView` 实例:
 	
    ```Swift
    @IBOutlet weak var interstitialView: RYInterstitialView!
    ```
 	
 2. 在 `viewDidLoad`(或者其他加载视图的时机) 中配置开屏广告 ID, 并且开始请求广告, 示例代码如下:
 
    ```Swift
    // 1. Required step1: configs `AdsID`
    interstitialView.adsID = "开屏广告ID"
    
    // 2. Required step2: load request
    interstitialView.loadRequest()
    ```
 
 3. **RYInterstitialViewDelegate** 提供广告加载成功、失败等可选代理方法, 具体使用可查看 framework 中对应注释.

 4. 详细代码请看 Demo 中 `InterstitialViewController` 类. 实现效果如下: (图五)


### 插屏广告

**插屏广告** 用于展示半屏广告. 通常用于 App 屏幕中间展示. 你可以使用 `RYInterstitialHalfView` 类来实现插屏广告的展示. framework 中提供插屏广告尺寸宽高比为 `510 : 510`. 在使用该广告之前, 你需要申请插屏广告的广告 ID. 集成插频广告的简单示例如下:

 1. 创建 `RYInterstitialHalfView ` 实例:
 	
    ```Swift
    @IBOutlet weak var halfInterstitialView: RYInterstitialHalfView!
    ```
 	
 2. 在 `viewDidLoad`(或者其他加载视图的时机) 中配置插屏广告 ID, 并且开始请求广告, 示例代码如下:
 
    ```Swift
    // 1. Required step1: configs `AdsID`
    halfInterstitialView.adsID = "插屏广告ID"
    
    // 2. Required step2: load request
    halfInterstitialView.loadRequest()
    ```
 
 3. **RYInterstitialHalfViewDelegate** 提供广告加载成功、失败等可选代理方法, 具体使用可查看 framework 中对应注释.

 4. 详细代码请看 Demo 中 `InterstitialHalfViewController` 类. 实现效果如下: (图六)


### 浮标广告

**浮标广告** 通常展示在页面的边角位置. 是五种广告中展示面积最小的一种. 你可以使用 `RYBuoyView` 类来实现浮标广告的展示. framework 中提供浮标广告尺寸宽高比为 `110 : 110`. 在使用该广告之前, 你需要申请浮标广告的广告 ID. 集成浮标广告的简单示例如下:

 1. 创建 `RYBuoyView` 实例:
 	
    ```Swift
    @IBOutlet weak var buoyView: RYBuoyView!
    ```
 	
 2. 在 `viewDidLoad`(或者其他加载视图的时机) 中配置浮标广告 ID, 并且开始请求广告, 示例代码如下:
 
    ```Swift
    // 1. Required step1: configs `AdsID`
    buoyView.adsID = "浮标广告ID"
    
    // 2. Required step2: load request
    buoyView.loadRequest()
    ```
 
 3. **RYBuoyViewDelegate** 提供广告加载成功、失败等可选代理方法, 具体使用可查看 framework 中对应注释.

 4. 详细代码请看 Demo 中 `BuoyViewController` 类. 实现效果如下: (图六)

## 常见问题

1. 加载广告未显示, 请检查对应广告 ID 是否正确;
2. 手动集成发生 `image not found` 错误: 确定 `RuiYuAdMob.bundle` 已经导入, 可在 `target` -> `Build Phases` -> `Copy Bundle Resources` 查看是否存在. 确保 `RuiYuAdMob.framework` 和 `RuiYuAdMob.bundle` 同时存在项目中.

## 版本日志

0.1.0: 接入五种常用广告.
