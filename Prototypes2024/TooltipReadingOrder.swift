import SwiftUI


///This prototype demos a technique for making a tooltip appear logically in the reading order for VoiceOver and keyboard users. In this case, the tool tip is read after that button it is attached to via .overlay.


// Text that goes inside the tooltip
private let tooltipText = "This is a tool tip. It should be read after the attached element."

// Adds empty space to make the demo scrollable
private struct EmptySpace: View {
  var body: some View {
    Rectangle()
      .fill(.clear)
      .frame(height: 200)
  }
}

struct TooltipReadingOrderDemo: View {
  @State var isTooltipHidden = true
  
  var body: some View {
    ScrollView {
      VStack {
        EmptySpace()
        // 1
        Text("This should be read first.")
          .font(.body)
        EmptySpace()
        HStack {
          // 2
          Text("Read this before the icon button.")
            .font(.body)
          // 3
          Button {
            print("Edit")
          } label: {
            Image(systemName: "pencil")
          }
          // MARK: Start of tooltip
          .overlay(
            // 4
            HStack {
              Text(tooltipText)
                .font(.body)
                .accessibility(sortPriority: -2)
              Button {
                print("Edit button was tapped")
              } label: {
                Image(systemName: "xmark")
              }
              .accessibility(sortPriority: -1)
              .accessibility(label: Text("Close tooltip"))
            }
              .frame(width:200, height: 100)
              .background(.yellow)
              .offset(y:-32)
            , alignment: .bottom
          )
          .accessibilityElement(children: .contain)
          // 3
          Text("Read this after the icon button.")
            .font(.body)
        }
        EmptySpace()
        // 4
        Text("This should be read after the icon button.")
          .font(.body)
        EmptySpace()
      }
      .padding(20)
    }
  }
}


#Preview("test") {
  TooltipReadingOrderDemo()
}
