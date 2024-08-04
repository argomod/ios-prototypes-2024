import SwiftUI


/// This demo demonstrates how the default ScaledMetric and relativeTo ScaledMetric scale at different rates. To test, adjust the Dynamic Type size in the canvas device settings.


struct ScaledMetricDemo: View {
  /// Default ScaledMetric
  @ScaledMetric var scaledSize40 = 40
  /// ScaledMetric that scales as a large title
  @ScaledMetric(relativeTo: .largeTitle) var largeTitleScaledSize40 = 40
  
  var body: some View {
    /// Static demo (green)
    Rectangle()
      .fill(.green)
      .frame(width: 40, height: 40)
    /// Default ScaledMetric demo (blue)
    Rectangle()
      .fill(.blue)
      .frame(width: scaledSize40, height: scaledSize40)
    /// relativeTo ScaledMetric demo (red)
    Rectangle()
      .fill(.red)
      .frame(width: largeTitleScaledSize40, height: largeTitleScaledSize40)
  }
}

#Preview {
  ScaledMetricDemo()
}
