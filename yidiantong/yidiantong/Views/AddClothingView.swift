import SwiftUI

struct AddClothingView: View {
    @State private var clothingName = ""
    @State private var selectedCategory = ClothingCategory.top
    @State private var selectedStyle = ClothingStyle.casual
    @State private var selectedColor = ClothingColor.black
    @State private var selectedWarmth = WarmthLevel.medium
    @State private var isClean = true
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("基本信息")) {
                    TextField("衣物名称", text: $clothingName)
                    
                    Picker("类别", selection: $selectedCategory) {
                        ForEach(ClothingCategory.allCases, id: \.self) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    
                    Picker("风格", selection: $selectedStyle) {
                        ForEach(ClothingStyle.allCases, id: \.self) { style in
                            Text(style.rawValue).tag(style)
                        }
                    }
                }
                
                Section(header: Text("属性设置")) {
                    Picker("颜色", selection: $selectedColor) {
                        ForEach(ClothingColor.allCases, id: \.self) { color in
                            HStack {
                                Circle()
                                    .fill(Color(color.rawValue))
                                    .frame(width: 20, height: 20)
                                Text(color.rawValue)
                            }.tag(color)
                        }
                    }
                    
                    Picker("保暖等级", selection: $selectedWarmth) {
                        ForEach(WarmthLevel.allCases, id: \.self) { level in
                            Text("\(level.description) - \(level.temperatureRange)").tag(level)
                        }
                    }
                    
                    Toggle("已清洁", isOn: $isClean)
                }
                
                Section {
                    Button(action: addClothing) {
                        HStack {
                            Spacer()
                            Text("添加衣物")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                    }
                    .disabled(clothingName.isEmpty)
                }
            }
            .navigationTitle("添加衣物")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("取消") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func addClothing() {
        // 这里应该保存到数据模型
        print("添加衣物: \(clothingName)")
        dismiss()
    }
}
