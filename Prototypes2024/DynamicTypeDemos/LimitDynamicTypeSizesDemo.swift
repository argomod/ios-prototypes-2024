import SwiftUI

/// This demo demonstrates how to limit Dynamic Type sizes. The modifier dynamicTypeSize modifier, if applied to a parent, cascades to all children. To test, adjust the Dynamic Type size in the canvas device settings


struct LimitDynamicTypeSizesDemo: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 16) {
        Text(lipsum)
          .font(.body)
        Text(longsum)
          .font(.body)
      }
      .padding(.horizontal, 20)
    }
    //MARK: Matt's Preference: Avoid using this!
    .dynamicTypeSize(.medium ... .xLarge)
  }
}

#Preview {
  LimitDynamicTypeSizesDemo()
}
