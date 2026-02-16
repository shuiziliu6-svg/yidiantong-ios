import SwiftUI

struct WardrobeView: View {
    @State private var clothingItems = ClothingItem.sampleItems
    @State private var selectedCategory: ClothingCategory?
    @State private var showingAddClothing = false
    
    var filteredItems: [ClothingItem] {
        if let category = selectedCategory {
            return clothingItems.filter { $0.category == category }
        }
        return clothingItems
    }
    
    var body: some View {
        VStack {
            // 分类筛选
            CategoryFilterView(
                selectedCategory: $selectedCategory
            )
            .padding(.horizontal)
            .padding(.top)
            
            if filteredItems.isEmpty {
                EmptyWardrobeView()
            } else {
                ClothingGridView(clothingItems: filteredItems)
            }
        }
        .navigationTitle("我的衣橱")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingAddClothing = true }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddClothing) {
            AddClothingView()
        }
    }
}

struct CategoryFilterView: View {
    @Binding var selectedCategory: ClothingCategory?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                Button(action: { selectedCategory = nil }) {
                    Text("全部")
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(selectedCategory == nil ? Color.blue : Color(.systemGray6))
                        .foregroundColor(selectedCategory == nil ? .white : .primary)
                        .cornerRadius(20)
                }
                
                ForEach(ClothingCategory.allCases, id: \.self) { category in
                    Button(action: { selectedCategory = category }) {
                        Text(category.rawValue)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(selectedCategory == category ? Color.blue : Color(.systemGray6))
                            .foregroundColor(selectedCategory == category ? .white : .primary)
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
}

struct ClothingGridView: View {
    let clothingItems: [ClothingItem]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(clothingItems) { item in
                    ClothingItemCard(item: item)
                }
            }
            .padding()
        }
    }
}

struct ClothingItemCard: View {
    let item: ClothingItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // 图片区域
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray6))
                    .frame(height: 120)
                
                VStack {
                    Image(systemName: "tshirt.fill")
                        .font(.system(size: 40))
                        .foregroundColor(Color(item.color.rawValue))
                    Text(item.name)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top, 4)
                }
            }
            
            // 信息区域
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.headline)
                    .lineLimit(1)
                
                HStack {
                    Text(item.style.rawValue)
                        .font(.caption)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(4)
                    
                    Spacer()
                    
                    Image(systemName: item.isClean ? "sparkles" : "exclamationmark.triangle")
                        .foregroundColor(item.isClean ? .green : .orange)
                        .font(.caption)
                }
            }
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct EmptyWardrobeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "hanger")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            
            Text("衣橱空空如也")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("添加你的第一件衣物，开始智能搭配吧！")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Button(action: {}) {
                Text("添加第一件衣物")
                    .fontWeight(.semibold)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(25)
            }
            .padding(.top, 20)
        }
        .padding()
    }
}
