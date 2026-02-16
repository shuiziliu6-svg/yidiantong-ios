import Foundation

// 衣物类别
enum ClothingCategory: String, CaseIterable, Codable {
    case top = "上衣"
    case bottom = "下装"
    case outerwear = "外套"
    case shoes = "鞋履"
    case accessories = "配饰"
}

// 衣物风格
enum ClothingStyle: String, CaseIterable, Codable {
    case casual = "休闲"
    case formal = "正式"
    case sporty = "运动"
    businessCasual = "商务休闲"
    case elegant = "优雅"
    case street = "街头"
}

// 衣物颜色
enum ClothingColor: String, CaseIterable, Codable {
    case black = "黑色"
    case white = "白色"
    case gray = "灰色"
    case navy = "藏青"
    case blue = "蓝色"
    case red = "红色"
    case green = "绿色"
    case yellow = "黄色"
    case pink = "粉色"
    case brown = "棕色"
    case beige = "米色"
    case purple = "紫色"
    case orange = "橙色"
}

// 衣物保暖等级
enum WarmthLevel: Int, CaseIterable, Codable {
    case veryLight = 1   // 非常轻薄
    case light = 2       // 轻薄
    case medium = 3      // 适中
    case warm = 4        // 温暖
    case veryWarm = 5    // 非常温暖
    
    var description: String {
        switch self {
        case .veryLight: return "非常轻薄"
        case .light: return "轻薄"
        case .medium: return "适中"
        case .warm: return "温暖"
        case .veryWarm: return "非常温暖"
        }
    }
    
    var temperatureRange: String {
        switch self {
        case .veryLight: return "适合25°C以上"
        case .light: return "适合20-25°C"
        case .medium: return "适合15-20°C"
        case .warm: return "适合10-15°C"
        case .veryWarm: return "适合10°C以下"
        }
    }
}

// 衣物模型
struct ClothingItem: Identifiable, Codable {
    let id: UUID
    var name: String
    var category: ClothingCategory
    var style: ClothingStyle
    var color: ClothingColor
    var warmthLevel: WarmthLevel
    var imageName: String?
    var lastWornDate: Date?
    var isClean: Bool
    var favorite: Bool
    
    // 初始化器
    init(
        id: UUID = UUID(),
        name: String,
        category: ClothingCategory,
        style: ClothingStyle,
        color: ClothingColor,
        warmthLevel: WarmthLevel,
        imageName: String? = nil,
        lastWornDate: Date? = nil,
        isClean: Bool = true,
        favorite: Bool = false
    ) {
        self.id = id
        self.name = name
        self.category = category
        self.style = style
        self.color = color
        self.warmthLevel = warmthLevel
        self.imageName = imageName
        self.lastWornDate = lastWornDate
        self.isClean = isClean
        self.favorite = favorite
    }
    
    // 示例数据
    static let sampleItems: [ClothingItem] = [
        ClothingItem(
            name: "白色衬衫",
            category: .top,
            style: .formal,
            color: .white,
            warmthLevel: .light
        ),
        ClothingItem(
            name: "蓝色牛仔裤",
            category: .bottom,
            style: .casual,
            color: .blue,
            warmthLevel: .medium
        ),
        ClothingItem(
            name: "黑色西装外套",
            category: .outerwear,
            style: .formal,
            color: .black,
            warmthLevel: .medium
        ),
        ClothingItem(
            name: "白色运动鞋",
            category: .shoes,
            style: .sporty,
            color: .white,
            warmthLevel: .medium
        ),
        ClothingItem(
            name: "灰色卫衣",
            category: .top,
            style: .casual,
            color: .gray,
            warmthLevel: .warm
        ),
        ClothingItem(
            name: "米色针织衫",
            category: .outerwear,
            style: .businessCasual,
            color: .beige,
            warmthLevel: .warm
        ),
    ]
}

// 搭配模型
struct Outfit: Identifiable, Codable {
    let id: UUID
    var name: String
    var score: Double // 0-10分
    var temperatureRange: String
    var description: String
    var items: [ClothingItem]
    var style: ClothingStyle
    var suitableScenes: [String]
    var dateRecommended: Date
    
    init(
        id: UUID = UUID(),
        name: String,
        score: Double,
        temperatureRange: String,
        description: String,
        items: [ClothingItem],
        style: ClothingStyle,
        suitableScenes: [String] = ["日常"],
        dateRecommended: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.score = score
        self.temperatureRange = temperatureRange
        self.description = description
        self.items = items
        self.style = style
        self.suitableScenes = suitableScenes
        self.dateRecommended = dateRecommended
    }
    
    // 示例搭配
    static let sampleOutfit = Outfit(
        name: "休闲通勤风",
        score: 8.5,
        temperatureRange: "适合18-25°C",
        description: "简约休闲，适合办公室环境",
        items: [
            ClothingItem.sampleItems[0], // 白色衬衫
            ClothingItem.sampleItems[1], // 蓝色牛仔裤
            ClothingItem.sampleItems[2], // 黑色西装外套
            ClothingItem.sampleItems[3], // 白色运动鞋
        ],
        style: .businessCasual,
        suitableScenes: ["办公室", "日常通勤"]
    )
}
