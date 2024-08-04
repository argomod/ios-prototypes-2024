import SwiftUI


/// This demo demonstrates how to shift layouts according to Dynamic Type sizes. To test, adjust the Dynamic Type size in the canvas device settings.


struct HStackDemo: View {
  /// Environment variable to get Dynamic Type size category
  @Environment(\.sizeCategory) var sizeCategory
  
  /// Two headlines with no specific layout
  private var headlines: some View {
    Group {
      Text("Meta’s Smart Glasses Are Becoming Artificially Intelligent. We Took Them for a Spin.")
        .font(.headline)
      Text("The Youths Have Spoken: Wallets Are Uncool. Go Digital.")
        .font(.headline)
    }
  }
  
  var body: some View {
    TabView {
      //MARK: Matt's Preference: Headlines stack vertically at AX1 and above
      Group {
        if sizeCategory.isAccessibilityCategory {
          VStack(alignment: .leading, spacing: 20) { headlines }
        } else {
          HStack(alignment: .top, spacing: 20) { headlines }
        }
      }
      .padding(.horizontal, 20)
      /// Headlines always stack horizontally
      HStack(alignment: .top, spacing: 20) { headlines }
        .padding(.horizontal, 20)
    }
    .tabViewStyle(.page)
  }
  
  /// Ignore
  init() {
    UIPageControl.appearance().currentPageIndicatorTintColor = .orange
    UIPageControl.appearance().pageIndicatorTintColor = .systemGray4
  }
}

#Preview {
  HStackDemo()
}
