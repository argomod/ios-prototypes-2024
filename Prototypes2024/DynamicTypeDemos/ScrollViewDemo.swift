import SwiftUI

/// This demo demonstrates why we ought to use ScrollView liberally, otherwise larger text may become unreadable. To test, adjust the Dynamic Type size in the canvas device settings


struct ScrollViewDemo: View {
  var body: some View {
    TabView {
      //MARK: Matt's Preference: Uses ScrollView
      ScrollView {
        Text(longsum)
          .font(.body)
          .padding(.horizontal, 20)
      }
      /// Does not use ScrollView
      Text(longsum)
        .font(.body)
        .padding(.horizontal, 20)
    }
    .tabViewStyle(.page)
  }
  
  /// Ignore
  init() {
    UIPageControl.appearance().currentPageIndicatorTintColor = .brown
    UIPageControl.appearance().pageIndicatorTintColor = .systemGray4
  }
}

#Preview {
  ScrollViewDemo()
}
