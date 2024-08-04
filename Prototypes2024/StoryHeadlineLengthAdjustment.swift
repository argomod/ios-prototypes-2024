import SwiftUI


/// This prototype demos a technique for preserving the legibility of headline in a horizontal lockup no matter the readers' preferred font size.
///
/// **How to use**
/// • Adjust the Dynamic Type size in the canvas device settings
/// • Observe how the current width decreases as the font size increases
/// • Once space becomes too cramped (less than 13 characters), the layout becomes a VStack


// The width of the character 'X' in the headline font (called headlineNews16, removed from this demo)
let headlineNews16X: CGFloat = 12

// The preferred minimum amount of characters a headline should span
let headlineCharacterCount : CGFloat = 13

// Stores the width of the headline
struct HeadlineWidthKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
    value = nextValue()
  }
}

// Thumbnail image
struct StoryCardThumbnail: View {
  // Scales the image size the same as text
  @ScaledMetric(relativeTo: .body) private var scale: CGFloat = 1
  
  var body: some View {
    Rectangle()
      .aspectRatio(1, contentMode: .fit)
      .overlay(
        Image("placeholder")
          .resizable()
          .scaledToFill()
      )
      .clipShape(Rectangle())
      .frame(width:80 * scale)
  }
}

// MARK: Start of story card
struct StoryHeadlineLengthAdjustment: View {
  // Scales the reference width of the character X in the headline
  @ScaledMetric(relativeTo: .headline) private var headlineNews16XScalable: CGFloat = headlineNews16X
  
  // Stores the size of the headline; it will be set by the preference key
  @State var headlineSize: CGSize = .zero
  
  var body: some View {
    // Formula the compare the width of the headline to the minimum preferred width, accounting for changes in Dynamic Type
    let isHeadlineTooShort = headlineSize.width > headlineNews16XScalable*headlineCharacterCount
    
    // Changes layout if the headline is too short
    let myLayout = isHeadlineTooShort ?
    AnyLayout(HStackLayout(alignment: .top, spacing: 8))
    : AnyLayout(VStackLayout(alignment: .leading, spacing:8))
    
    ScrollView {
      myLayout {
        // Headline, description, reading time
        VStack(alignment: .leading, spacing: 0) {
          Text("It’s Time to Sweat. The East Coast’s First Heat Wave Is on the Way.")
            .font(.headline)
            .foregroundColor(.black)
            .padding(.bottom, 8)
            .background(
              GeometryReader { geometry in
                Color.clear
                  .preference(key: HeadlineWidthKey.self, value: geometry.size)
              }
            )
            .border(.orange)
            .onPreferenceChange(HeadlineWidthKey.self) { size in
              headlineSize = size
            }
          Text("The abrupt arrival of summer will bring stifling temperatures from Chicago to New York, with little relief overnight.")
            .font(.subheadline)
            .foregroundColor(.black)
            .padding(.bottom, 8)
          Text("3 min read")
            .font(.caption)
            .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        StoryCardThumbnail()
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal, 20)
      
      // Debugger that shows the current and preferred minimum width of the headline
      VStack (alignment: .leading) {
        Text("Current width: \(headlineSize.width)")
          .foregroundStyle(.orange)
        Text("Preferred min. width: \(headlineNews16XScalable*headlineCharacterCount)")
          .foregroundStyle(.green)
      }
      .padding(24)
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(.black)
    }
  }
}


#Preview {
  StoryHeadlineLengthAdjustment()
}
