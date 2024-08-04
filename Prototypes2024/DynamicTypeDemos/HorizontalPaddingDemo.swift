import SwiftUI


/// This demo demonstrates the pitfalls and preferred ways to treat padding with Dynamic Type. To test, adjust the Dynamic Type size in the canvas device settings.


struct HorizontalPaddingDemo: View {
  // ScaledMetric that starts at 20 and grows depending on Dynamic Type size
  @ScaledMetric var scaledSize20 = 20
  
  var body: some View {
    TabView {
      // MARK: Matt's Preference: Horizontal padding does not scale
      ScrollView {
        Text(longersum)
          .font(.body)
      }
      .padding(.horizontal, 20)
      /// Horizontal padding scales with font size
      ScrollView {
        Text(longersum)
          .font(.body)
      }
      .padding(.horizontal, scaledSize20)
    }
    .tabViewStyle(.page)
  }
  
  /// Ignore
  init() {
    UIPageControl.appearance().currentPageIndicatorTintColor = .magenta
    UIPageControl.appearance().pageIndicatorTintColor = .systemGray4
  }
}

#Preview {
  HorizontalPaddingDemo()
}
