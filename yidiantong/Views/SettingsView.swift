import SwiftUI

struct SettingsView: View {
    @AppStorage("temperatureUnit") private var temperatureUnit = "°C"
    @AppStorage("enableNotifications") private var enableNotifications = true
    @AppStorage("selectedCity") private var selectedCity = "北京"
    
    let cities = ["北京", "上海", "广州", "深圳", "杭州", "成都"]
    
    var body: some View {
        Form {
            Section(header: Text("天气设置")) {
                Picker("所在城市", selection: $selectedCity) {
                    ForEach(cities, id: \.self) { city in
                        Text(city).tag(city)
                    }
                }
                
                Picker("温度单位", selection: $temperatureUnit) {
                    Text("摄氏度 (°C)").tag("°C")
                    Text("华氏度 (°F)").tag("°F")
                }
            }
            
            Section(header: Text("通知设置")) {
                Toggle("推送通知", isOn: $enableNotifications)
                
                if enableNotifications {
                    NavigationLink("通知时间") {
                        NotificationSettingsView()
                    }
                }
            }
            
            Section(header: Text("偏好设置")) {
                NavigationLink("风格偏好") {
                    StylePreferenceView()
                }
                
                NavigationLink("颜色偏好") {
                    ColorPreferenceView()
                }
            }
            
            Section {
                Button("重置所有数据") {
                    // 重置数据
                }
                .foregroundColor(.red)
            }
            
            Section(header: Text("关于")) {
                HStack {
                    Text("版本")
                    Spacer()
                    Text("1.0.0")
                        .foregroundColor(.gray)
                }
                
                Link("用户协议", destination: URL(string: "https://example.com/terms")!)
                Link("隐私政策", destination: URL(string: "https://example.com/privacy")!)
                
                Button("联系客服") {
                    // 联系客服
                }
            }
        }
        .navigationTitle("设置")
    }
}

struct NotificationSettingsView: View {
    @State private var morningTime = Date()
    @State private var eveningTime = Date()
    
    var body: some View {
        Form {
            Section(header: Text("穿搭提醒时间")) {
                DatePicker("早晨提醒", selection: $morningTime, displayedComponents: .hourAndMinute)
                DatePicker("晚间提醒", selection: $eveningTime, displayedComponents: .hourAndMinute)
            }
            
            Text("每天在指定时间为您推送当日穿搭建议")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.horizontal)
        }
        .navigationTitle("通知设置")
    }
}

struct StylePreferenceView: View {
    @State private var preferredStyles: Set<ClothingStyle> = [.casual, .businessCasual]
    
    var body: some View {
        Form {
            Section(header: Text("选择您喜欢的风格")) {
                ForEach(ClothingStyle.allCases, id: \.self) { style in
                    Toggle(style.rawValue, isOn: Binding(
                        get: { preferredStyles.contains(style) },
                        set: { isOn in
                            if isOn {
                                preferredStyles.insert(style)
                            } else {
                                preferredStyles.remove(style)
                            }
                        }
                    ))
                }
            }
            
            Text("系统会优先推荐您喜欢的风格")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.horizontal)
        }
        .navigationTitle("风格偏好")
    }
}

struct ColorPreferenceView: View {
    @State private var preferredColors: Set<ClothingColor> = [.black, .white, .blue]
    
    var body: some View {
        Form {
            Section(header: Text("选择您喜欢的颜色")) {
                ForEach(ClothingColor.allCases, id: \.self) { color in
                    HStack {
                        Circle()
                            .fill(Color(color.rawValue))
                            .frame(width: 24, height: 24)
                        
                        Text(color.rawValue)
                        
                        Spacer()
                        
                        Toggle("", isOn: Binding(
                            get: { preferredColors.contains(color) },
                            set: { isOn in
                                if isOn {
                                    preferredColors.insert(color)
                                } else {
                                    preferredColors.remove(color)
                                }
                            }
                        ))
                        .labelsHidden()
                    }
                }
            }
        }
        .navigationTitle("颜色偏好")
    }
}
