import SwiftUI


/// This prototype demos a technique for presenting and positioning a custom context menu as an alternative to Apple's Menu. It utilizes .fullScreenCover for presentation and geometry reader for spacial data. Because the geometry reader is inside the .fullScreenCover, this custom context menu is still a self-contained component (access to a root element is not needed).
///
/// **To do:**
/// Review if disabling default animation via .transaction affects other elements


// MARK: Geometry Reader things
/// Geometry reader helper
struct ViewGeometry: View {
  var body: some View {
    GeometryReader { geometry in
      Color.clear
      /// Height and width of context menu
        .preference(key: ContextMenuSize.self, value: geometry.size)
      /// Maximum y coordinate of context menu
        .preference(key: ContextMenuMaxY.self, value: geometry.frame(in: .global).maxY)
      /// Minimum y coordinate of context menu
        .preference(key: ContextMenuMinY.self, value: geometry.frame(in: .global).minY)
      /// Height and width of button
        .preference(key: ContextMenuTriggerSize.self, value: geometry.size)
      /// Minimum x coordinate of button
        .preference(key: ContextMenuTriggerMinX.self, value: geometry.frame(in: .global).minX)
      /// Minimum Y coordinate of button
        .preference(key: ContextMenuTriggerMinY.self, value: geometry.frame(in: .global).minY)
      /// Maximum Y coordinate of button
        .preference(key: ContextMenuTriggerMaxY.self, value: geometry.frame(in: .global).maxY)
    }
  }
}
/// Context Menu height & width key
struct ContextMenuSize: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
    value = nextValue()
  }
}
/// Context Menu max Y key
struct ContextMenuMaxY: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}
/// Context Menu min Y key
struct ContextMenuMinY: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}
/// Context Menu trigger height & width key
struct ContextMenuTriggerSize: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
    value = nextValue()
  }
}
/// Context Menu trigger min Y key
struct ContextMenuTriggerMinY: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}
/// Context Menu trigger max Y key
struct ContextMenuTriggerMaxY: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}
/// Context Menu trigger min X key
struct ContextMenuTriggerMinX: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}

// MARK: Context Menu
struct ContextMenu: View {
  @State private var contextMenuHeight: CGFloat = 0
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      
      // 1. Listen to article
      Button {
        //
      } label: {
        HStack(spacing: 12) {
          Text("Listen to article")
            .font(.body)
            .foregroundStyle(.black)
          Spacer()
        }
      }
      .padding(.vertical, 12)
      .padding(.horizontal, 16)
      .frame(maxWidth: .infinity)
      
      // 2. Save
      Button {
        //
      } label: {
        HStack(spacing: 12) {
          Text("Save")
            .font(.body)
            .foregroundStyle(.black)
          Spacer()
        }
      }
      .padding(.vertical, 12)
      .padding(.horizontal, 16)
      .frame(maxWidth: .infinity)
      
      // 3. View 12 comments
      Button {
        //
      } label: {
        HStack(spacing: 12) {
          Text ("View 12 comments")
            .font(.body)
            .foregroundStyle(.black)
          Spacer()
        }
      }
      .padding(.vertical, 12)
      .padding(.horizontal, 16)
      .frame(maxWidth: .infinity)
      
      // 4. Share
      Button {
        //
      } label: {
        HStack(spacing: 12) {
          Text ("Share")
            .font(.body)
            .foregroundStyle(.black)
          Spacer()
        }
      }
      .padding(.vertical, 12)
      .padding(.horizontal, 16)
      .frame(maxWidth: .infinity)
      
      // 5. Gift
      Button {
        //
      } label: {
        HStack(spacing: 12) {
          Text ("Gift")
            .font(.body)
            .foregroundStyle(.black)
          Spacer()
        }
      }
      .padding(.vertical, 12)
      .padding(.horizontal, 16)
      .frame(maxWidth: .infinity)
    }
    .frame(width: 200)
    .background(.brown)
    .cornerRadius(3.0)
  }
}


// MARK: Context Menu with invisible background target to dismiss
struct ContextMenuWithBackgroundTarget: View {
  /// Geometry reader data to pass to the button
  @Binding var isVisible: Bool
  @Binding var buttonMinX: CGFloat
  @Binding var buttonMinY: CGFloat
  @Binding var buttonMaxY: CGFloat
  @Binding var buttonHeight: CGFloat
  @Binding var buttonWidth: CGFloat
  /// Geometry reader data for the Context Menu
  @State private var contextMenuMaxY: CGFloat = .zero
  @State private var contextMenuMinY: CGFloat = .zero
  @State private var contextMenuHeight: CGFloat = .zero
  @State private var contextMenuWidth: CGFloat = .zero
  @State private var contextMenuVerticalSpace: CGFloat = 8
  @State private var contextMenuLeftPadding: CGFloat = 20
  @State private var contextMenuPositionY: CGFloat = .zero
  @State private var contextMenuPositionX: CGFloat = .zero
  
  // MARK: WIP!!!
  /// Sets the x position of Context Menu
  func setContextMenuPositionX() {
    if buttonMinX < contextMenuWidth {
      // Position left
      contextMenuPositionX = buttonMinX - (contextMenuWidth/2)
    } else {
      //Position right
      contextMenuPositionX = buttonMinX - (contextMenuWidth*1.5) + buttonWidth
    }
  }
  /// Sets the y position of Context Menu
  func setContextMenuPositionY() {
    if buttonMinY - contextMenuMaxY > contextMenuVerticalSpace {
      /// Position upward if enough space is available
      let _ = print("Position upward")
      contextMenuPositionY = buttonMinY - contextMenuMaxY - contextMenuVerticalSpace
    } else {
      /// Position downward if not enough space available above
      let _ = print("Position downward")
      contextMenuPositionY = buttonMaxY + contextMenuVerticalSpace - contextMenuMinY
    }
  }
  
  var body: some View {
    ZStack(alignment: .top) {
      /// Invisible background target behind the Context Menu
      Rectangle()
        .fill(.clear)
      // Uses UIScreen height because it's always larger than width
        .frame(width: UIScreen.main.bounds.height*2, height: UIScreen.main.bounds.height*2)
        .position(x:0, y:0)
        .contentShape(Rectangle())
        .onTapGesture() {
          isVisible = false
        }
      /// Context Menu
      ContextMenu()
        .background(
          /// Geometry reader to get height and width
          ViewGeometry()
            .onPreferenceChange(ContextMenuSize.self) { size in
              contextMenuHeight = size.height
              contextMenuWidth = size.width
            }
            .onPreferenceChange(ContextMenuMaxY.self) { value in
              contextMenuMaxY = value
            }
            .onPreferenceChange(ContextMenuMinY.self) { value in
              contextMenuMinY = value
            }
        )
        .offset(x:contextMenuPositionX, y:contextMenuPositionY)
        .onAppear {
          setContextMenuPositionX()
          setContextMenuPositionY()
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}


// MARK: Button
struct Test: View {
  /// State variables for the .fullScreenCover that contains the Context Menu
  @State var isFullScreenCoverPresented = false
  @State var isFullScreenViewVisible = false
  /// Geometry reader data for the button
  @State var contextMenuTriggerMinY: CGFloat = .zero
  @State var contextMenuTriggerMaxY: CGFloat = .zero
  @State var contextMenuTriggerMinX: CGFloat = .zero
  @State private var contextMenuTriggerHeight: CGFloat = .zero
  @State private var contextMenuTriggerWidth: CGFloat = .zero
  
  var body: some View {
    VStack {
      /// Button
      Button {
        isFullScreenCoverPresented = true
      } label: {
        Image(systemName: "ellipsis")
      }
      .frame(width: 24, height: 24)
      .background(.yellow)
      .background(
        /// Set the geometry readers for the button
        ViewGeometry()
          .onPreferenceChange(ContextMenuTriggerMinX.self) { value in
            contextMenuTriggerMinX = value
          }
          .onPreferenceChange(ContextMenuTriggerMinY.self) { value in
            contextMenuTriggerMinY = value
          }
          .onPreferenceChange(ContextMenuTriggerMaxY.self) { value in
            contextMenuTriggerMaxY = value
          }
          .onPreferenceChange(ContextMenuTriggerSize.self) { size in
            contextMenuTriggerHeight = size.height
            contextMenuTriggerWidth = size.width
          }
      )
    }
    /// .fullScreenCover that contains the Context Menu and bindings that pass the button's geometry reader data
    .fullScreenCover(isPresented: $isFullScreenCoverPresented) {
      Group {
        if isFullScreenViewVisible {
          ContextMenuWithBackgroundTarget(
            isVisible: $isFullScreenViewVisible,
            buttonMinX: $contextMenuTriggerMinX,
            buttonMinY: $contextMenuTriggerMinY,
            buttonMaxY: $contextMenuTriggerMaxY,
            buttonHeight: $contextMenuTriggerHeight,
            buttonWidth: $contextMenuTriggerWidth
          )
          .onDisappear {
            isFullScreenCoverPresented = false
          }
        }
      }
      .presentationBackground(.black.opacity(0))
      .onAppear {
        isFullScreenViewVisible = true
      }
    }
    /// Turns off default animation and provides a new animation
    .transaction({ transaction in
      transaction.disablesAnimations = true
      transaction.animation = .easeIn(duration: 0.05)
    })
  }
}

struct CustomContextMenuDemo: View {
  var body: some View {
    ScrollView([.horizontal, .vertical]) {
      Rectangle()
        .fill(.clear)
        .frame(width: 600, height: 600)
      Test()
      Rectangle()
        .fill(.clear)
        .frame(width: 600, height: 800)
    }
    .accentColor(.black)
  }
}

#Preview {
  CustomContextMenuDemo()
}
