import Foundation

// 天气模型
struct Weather: Codable {
    var city: String
    var temperature: Int
    var condition: WeatherCondition
    var humidity: Int
    var windSpeed: Double
    var date: Date
    
    var temperatureString: String {
        return "\(temperature)°C"
    }
    
    // 示例数据
    static let sample = Weather(
        city: "北京",
        temperature: 22,
        condition: .sunny,
        humidity: 65,
        windSpeed: 2.5,
        date: Date()
    )
}

// 天气状况
enum WeatherCondition: String, CaseIterable, Codable {
    case sunny = "晴"
    case cloudy = "多云"
    case overcast = "阴天"
    case rainy = "雨天"
    case thunderstorm = "雷阵雨"
    case snowy = "雪天"
    case foggy = "雾天"
    case windy = "大风"
    
    var icon: String {
        switch self {
        case .sunny: return "sun.max.fill"
        case .cloudy: return "cloud.sun.fill"
        case .overcast: return "cloud.fill"
        case .rainy: return "cloud.rain.fill"
        case .thunderstorm: return "cloud.bolt.rain.fill"
        case .snowy: return "snow"
        case .foggy: return "cloud.fog.fill"
        case .windy: return "wind"
        }
    }
    
    var color: String {
        switch self {
        case .sunny: return "FF9500"
        case .cloudy: return "8E8E93"
        case .overcast: return "5D5D5D"
        case .rainy: return "0A84FF"
        case .thunderstorm: return "5856D6"
        case .snowy: return "5AC8FA"
        case .foggy: return "C7C7CC"
        case .windy: return "34C759"
        }
    }
}
