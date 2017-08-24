# iOS-Performance-Optimization
关于iOS 性能优化梳理：
基本工具、业务优化、内存优化、卡顿优化、布局优化、电量优化、 安装包瘦身、启动优化、网络优化等

#### iOS 官方文档
> 专题内容比较多，后面细分内容会有部分重复。
* [Performance 专题](https://developer.apple.com/library/content/navigation/#section=Topics&topic=Performance) 

#### iOS 性能优化相关书籍
* [Pro iOS Apps Performance Optimization](http://download.csdn.net/detail/tskyming/9831453)
* [High Performance iOS Apps](http://download.csdn.net/detail/tskyming/9831465)

#### Instruments 工具相关
* [Instruments User Guide](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/InstrumentsUserGuide/index.html) [中文翻译-PDF](http://cdn.cocimg.com/bbs/attachment/Fid_6/6_24457_90eabb4ed5b3863.pdf) 
* [Instruments之Leaks学习](http://www.cnblogs.com/lxlx1798/p/6933485.html) 
* [Instruments学习之Allocations](http://www.cnblogs.com/lxlx1798/p/6933195.html) 
* [instrument之Time Profiler总结](http://www.cnblogs.com/lxlx1798/p/6933604.html)
* [Instruments学习之Core Animation学习](http://www.cnblogs.com/lxlx1798/p/6933364.html) 
* [Instruments之Activity Monitor使用入门](http://www.cnblogs.com/lxlx1798/p/6933141.html) 
* [使用Instrument调试界面卡顿](http://www.jianshu.com/p/9dbbc91c8059)
* [Core Animation性能调优](https://github.com/AttackOnDobby/iOS-Core-Animation-Advanced-Techniques/blob/master/12-%E6%80%A7%E8%83%BD%E8%B0%83%E4%BC%98/%E6%80%A7%E8%83%BD%E8%B0%83%E4%BC%98.md)

#### 综合篇
* [微信读书iOS性能优化](http://wereadteam.github.io/2016/05/03/WeRead-Performance/)
* [微信读书 iOS 质量保证及性能监控](http://wereadteam.github.io/2016/12/12/Monitor/)
* [深入剖析 iOS 性能优化](https://ming1016.github.io/2017/06/20/deeply-ios-performance-optimization/)
* [魔窗研发副总裁沈哲：移动端SDK的优化之路](http://blog.csdn.net/magicwindow/article/details/51423463)
* [搜狗输入法 iOS 版开发与优化实践](http://www.cocoachina.com/design/20160905/17483.html)[PPT](https://github.com/MDCC2016/iOS-Session-Slides/blob/master/%E6%90%9C%E7%8B%97%E8%BE%93%E5%85%A5%E6%B3%95%E6%80%A7%E8%83%BD%E4%BC%98%E5%8C%96%E5%AE%9E%E8%B7%B5-%E6%9D%8E%E8%85%BE%E6%9D%B0.pdf)
* [蘑菇街 App 的稳定性与性能实践](http://www.infoq.com/cn/presentations/stability-and-performance-of-mogujie-app)[PPT](https://sanwen8.cn/p/6e5c888.html)
* [⼿淘iOS性能优化探索](http://pstatic.geekbang.org/pdf/593a53d813cef.pdf?e=1497499485&token=eHNJKRTldoRsUX0uCP9M3icEhpbyh3VF9Nrk5UPM:sa-xp_aIeIhtiWbqR-hY4ImMzFc=)
* [iOS App 稳定性指标及监测](https://juejin.im/post/58ca0832a22b9d006418fe43)

#### 内存优化
* [Memory Usage Performance Guidelines](https://developer.apple.com/library/content/documentation/Performance/Conceptual/ManagingMemory/ManagingMemory.html#//apple_ref/doc/uid/10000160i) 

#### 卡顿优化
* [微信iOS卡顿监控系统](http://mp.weixin.qq.com/s?__biz=MzAwNDY1ODY2OQ%3D%3D&idx=1&mid=207890859&scene=23&sn=e98dd604cdb854e7a5808d2072c29162&srcid=0921FzoCw9j1W7n4uFYKuarC#rd)
* [iOS-卡顿检测](http://www.cnblogs.com/gatsbywang/p/5555200.html)
* [iOS监控：卡顿检测](http://ios.jobbole.com/93085/)
* [iOS应用UI线程卡顿监控](https://mp.weixin.qq.com/s?__biz=MzI5MjEzNzA1MA==&mid=2650264136&idx=1&sn=052c1db8131d4bed8458b98e1ec0d5b0&chksm=f406837dc3710a6b49e76ce3639f671373b553e8a91b544e82bb8747e9adc7985fea1093a394#rd)
* [iOS 保持界面流畅的技巧](http://blog.ibireme.com/2015/11/12/smooth_user_interfaces_for_ios/)
* [实现 60fps 的网易云音乐首页](https://mp.weixin.qq.com/s?__biz=MzA4MzEwOTkyMQ==&mid=2667379069&idx=1&sn=376d9ef2261cf13e930406f1c35d3569&chksm=84f32833b384a1250ef66f76a8d050216fd3b0bd4ea99b55f4a609cf268c8169ac2889746245&mpshare=1&scene=1&srcid=0810MDXnroCGDhecWqlXazwE&key=05d58d453d781a66b453e3d41dd8d420839dd771948b07f8c8afe3482922901ad13e8c8ab46f48d0883e9b55d304f6ce272854ecc200f68557644581408036c8ee0c5154fbf413a007cd7617b0e086f6&ascene=0&uin=MjY1NTg0NzMyMQ%3D%3D&devicetype=iMac+MacBookPro11%2C4+OSX+OSX+10.12.5+build(16F73)&version=12020810&nettype=WIFI&fontScale=100&pass_ticket=OB4hdN6ImVq0WXd%2BDAJVSADk3OsXMiJH5VzZqXk%2F7meSbJNPMBTUB2z5%2Fct%2BuPmN) 

#### 布局优化
TODO：

#### 电量优化 
* [Guide - Energy Efficiency Guide for iOS Apps](https://developer.apple.com/library/content/documentation/Performance/Conceptual/EnergyGuide-iOS/index.html#//apple_ref/doc/uid/TP40015243)
* [WWDC2017 - Writing Energy Efficient Apps](https://developer.apple.com/videos/play/wwdc2017/238/)
* [iOS 常见耗电量检测方案调研](https://github.com/ChenYilong/iOSBlog/issues/10)
* [教你开发省电的 iOS app（WWDC17 观后）](http://www.jianshu.com/p/f0dc653d04ca)

#### 启动优化
* [今日头条iOS客户端启动速度优化](https://techblog.toutiao.com/2017/01/17/iosspeed/#more)
* [WWDC 2016 Session笔记：App启动时间优化](http://mp.weixin.qq.com/s?__biz=MzA3ODg4MDk0Ng==&mid=2651112831&idx=1&sn=4c7a06af9a726989cd7201bea7de6830&chksm=844c6ca2b33be5b4df92b67fe7912780c1977f8f993b55520a0d17abb3daf9defb09731c3167&scene=0#rd)
* [百度输入法-iOS 启动速度优化](http://www.infoq.com/cn/presentations/ios-typewriting-start-speed-optimization)
* [Facebook iOS App如何优化启动时间](http://www.cocoachina.com/ios/20160104/14870.html)
* [obj中国-Mach-O 可执行文件](https://objccn.io/issue-6-3/)
* [iOS App 启动性能优化](https://mp.weixin.qq.com/s/Kf3EbDIUuf0aWVT-UCEmbA)

#### 体积优化
* [iOS微信安装包瘦身](http://mp.weixin.qq.com/s?__biz=MzAwNDY1ODY2OQ==&mid=207986417&idx=1&sn=77ea7d8e4f8ab7b59111e78c86ccfe66&scene=24&srcid=0921TTAXHGHWKqckEHTvGzoA#rd)
* [今日头条IPA安装包的优化](https://techblog.toutiao.com/2016/12/27/iphone/)
* [iOS瘦身之删除FrameWork中无用mach-O文件](http://www.infoq.com/cn/articles/ios-thinning-delete-unnecessary-mach-o)
* [基于clang插件的一种iOS包大小瘦身方案](http://www.infoq.com/cn/articles/clang-plugin-ios-app-size-reducing)
* [iOS可执行文件瘦身方法](http://blog.cnbang.net/tech/2544/)
* [iOS图片优化方案](http://crespoxiao.github.io/2016/11/12/iOS%E5%9B%BE%E7%89%87%E4%BC%98%E5%8C%96%E6%96%B9%E6%A1%88/)
* [滴滴出行 iOS 端瘦身实践的 Slides](https://ming1016.github.io/2017/06/12/gmtc-ios-slimming-practice/)

#### 网络优化
* [美团点评移动网络优化实践](http://tech.meituan.com/SharkSDK.html)
* [开源版HttpDNS方案详解](http://mp.weixin.qq.com/s?__biz=MzAwMDU1MTE1OQ==&mid=209805123&idx=1&sn=ced8d67c3e2cc3ca38ef722949fa21f8)
* [携程App的网络性能优化实践](http://www.infoq.com/cn/articles/how-ctrip-improves-app-networking-performance)
* [2016年携程App网络服务通道治理和性能优化实践](http://www.infoq.com/cn/articles/app-network-service-and-performance-optimization-of-ctrip)
* [蘑菇街App Chromium网络栈实践](http://www.infoq.com/cn/articles/mogujie-app-chromium-network-layer)
* [蘑菇街高并发多终端无线网关实践](http://www.infoq.com/cn/presentations/mogujie-high-concurrent-multi-terminal-wireless-gateway-practice)

#### APM 
* [网易 - NeteaseAPM iOS SDK技术实现分享](http://mp.weixin.qq.com/s?__biz=MzA3ODg4MDk0Ng==&mid=2651112215&idx=1&sn=9cc5b5fa630542a6d4b7a5626e35217a#rd)
* [网易乐得 - iOS无埋点数据SDK实践之路](http://www.jianshu.com/p/69ce01e15042) 
* [听云 - 移动端 APM 产品研发技能](http://www.infoq.com/cn/presentations/mobile-terminal-apm-product-development-skills) 
* [听云 - 移动 App 性能监测](http://www.infoq.com/cn/presentations/mobile-app-performance-monitoring-practice?utm_source=presentations_about_mobile&utm_medium=link&utm_campaign=mobile)
* [iOS 性能监控 SDK —— Wedjat（华狄特）开发过程的调研和整理](https://github.com/aozhimin/iOS-Monitor-Platform)
* [揭秘 APM iOS SDK 的核心技术](https://github.com/iOS-APM/iOS-APM-Secrets)  

#### 调试 & Crash
* [iOS 项目开发过程中用到的高级调试技巧，涉及三方库动态调试、静态分析和反编译等领域](https://github.com/aozhimin/iOS-Debug-Hacks)
* [Understanding and Analyzing Application Crash Reports](https://developer.apple.com/library/content/technotes/tn2151/_index.html) 


#### 相关开源库
##### 网络
* [HTTPDNSLib-for-iOS](https://github.com/CNSRE/HTTPDNSLib-for-iOS)
* [HTTPDNSLib-for-Andorod](https://github.com/CNSRE/HTTPDNSLib)
* [NetworkEye](https://github.com/coderyi/NetworkEye/blob/master/README_Chinese.md) 

##### 卡顿
* [PerformanceMonitor-Runloop](https://github.com/suifengqjn/PerformanceMonitor)
* [GYMonitor-FPS](https://github.com/featuretower/GYMonitor)

##### 瘦身
* [LSUnusedResources](https://github.com/tinymind/LSUnusedResources)
* [LinkMap](https://github.com/huanxsd/LinkMap)

#### APM
* [iOS-System-Services](https://github.com/iOS-APM/iOS-System-Services)
* [System Monitor](https://github.com/iOS-APM/SystemMonitor)
* [GT](https://github.com/Tencent/GT) 

