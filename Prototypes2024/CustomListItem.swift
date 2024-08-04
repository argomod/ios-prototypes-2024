import SwiftUI


/// This prototype demos a technique for creating a custom list item. Because the list item uses NavigationLink, it still works with NavigationStack.


// Line between list items
struct Divider: View {
  var body: some View {
    Rectangle()
      .fill(Color(UIColor.systemGray4))
      .frame(maxWidth: .infinity)
      .frame(height: 1)
  }
}

// List item
struct CustomListItem: View {
  var body: some View {
    NavigationLink {
      Text("You made it")
    } label: {
      HStack(spacing: 0) {
        Text("Notifications")
          .font(.body)
        Spacer()
        Image(systemName: "chevron.right")
      }
      .foregroundStyle(.black)
      .padding(.vertical, 16)
      .padding(.horizontal, 16)
    }
  }
}

// MARK: Start of demo
struct CustomListItemDemo: View {
  var body: some View {
    NavigationStack {
      VStack(spacing: 0) {
        CustomListItem()
        Divider()
        CustomListItem()
        Divider()
        CustomListItem()
      }
      .background(Color(UIColor.systemGray6))
      .padding(.horizontal, 20)
      .cornerRadius(3)
    }
    .accentColor(.black)
  }
}

#Preview {
  CustomListItemDemo()
}
