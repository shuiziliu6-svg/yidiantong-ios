# 衣点通 - 智能穿搭助手 iOS版

## 项目结构

```
YiDianTong/
├── YiDianTongApp.swift          # 应用入口
├── ContentView.swift             # 主视图控制器
├── Info.plist                    # 权限配置
│
├── Models/                       # 数据模型
│   ├── AppState.swift           # 应用状态管理
│   └── ClothingItem.swift       # 衣物数据模型
│
├── Views/                        # 视图文件
│   ├── Onboarding/              # 引导页
│   │   ├── OnboardingView.swift
│   │   └── PermissionView.swift
│   ├── Home/                    # 首页
│   │   └── HomeView.swift
│   ├── Wardrobe/                # 衣橱（待开发）
│   └── Recommendation/          # 推荐（待开发）
│
├── ViewModels/                   # 视图模型（待添加）
├── Services/                     # 服务层（待添加）
│
└── Utils/                        # 工具类
    ├── ColorExtension.swift     # 颜色扩展
    └── ButtonStyles.swift       # 按钮样式
```

## 开发环境

- macOS 13.0+
- Xcode 15.0+
- iOS 16.0+
- Swift 5.9+

## 如何在 Xcode 中打开

### 方法一：创建新项目并导入文件

1. 打开 Xcode
2. File → New → Project
3. 选择 iOS → App
4. Product Name: YiDianTong
5. Interface: SwiftUI
6. Language: Swift
7. 创建项目后，将本文件夹中的所有 .swift 文件拖入项目
8. 将 Info.plist 内容复制到项目的 Info.plist

### 方法二：使用本脚本

运行本脚本后，会在桌面创建项目文件夹，然后：

1. 打开 Xcode
2. File → New → Project
3. 选择项目位置为桌面上的 YiDianTong 文件夹
4. 按照上面的步骤完成

## 当前功能

✅ A01 - 启动与引导页
- 三屏滑动引导
- 原生 iOS 动画
- 四个权限请求弹窗
- 权限状态保存（UserDefaults）
- 完成后跳转首页

## 下一步开发

- [ ] A02 - 首页（今日推荐）
- [ ] A03 - 推荐详情
- [ ] A04 - 衣物录入
- [ ] A05 - 我的衣橱
- [ ] 天气 API 集成
- [ ] AI 识别集成

## 技术栈

- SwiftUI（声明式UI）
- Combine（响应式编程）
- UserDefaults（本地存储）
- 后续：CoreData、Vision、CoreML

## 注意事项

1. 真机测试需要 Apple Developer 账号
2. 模拟器可以直接运行
3. 权限请求只在真机上生效
4. 重置引导页：删除应用重装
