import SwiftUI

/// This a collection of prototypes to demo Dynamic Type techniques. Adjust the Dynamic Type size in the canvas device settings to test them out.

let lipsum = "Raffle Lorem ipsum dolor sit amet, ffil consectetur adipiscing elit."

let longsum = "Fusce eu scelerisque odio. Nunc vulputate sodales magna, ac vulputate felis suscipit in. Integer ac eros placerat, condimentum justo sit amet maximus. Raffle Lorem ipsum dolor sit amet, ffil consectetur adipiscing elit"

let longersum = "Scientists approved a blueprint for the next two decades of particle physics in the U.S. on Friday. It aims to restore American primacy in high energy particle physics. The new strategy calls on physicists to begin laying the groundwork for a revolutionary particle collider that could be built on American soil. The machine would collide tiny, point-like muons, which resemble electrons but are more massive. Muons provide more bang for the buck than the protons used in the Large Hadron Collider at CERN, and would push the search for new forces and particles deeper than ever into the unknown. The siting of such a project, perhaps at the Fermi National Accelerator Laboratory in Illinois, would restore American particle physics to a position of pre-eminence that was ceded to Europe in 1993 when Congress canceled the giant Superconducting Super Collider. But it will take at least 10 years to demonstrate that the muon collider could work and how much it would cost. “This is our muon shot,” the committee, charged with outlining a vision for the next decade of American particle physics, said in a report titled “Exploring the Quantum Universe: Pathways to Innovation and Discovery in Particle Physics.” It was presented and discussed at a meeting in Washington, D.C., on Thursday and Friday, and will be discussed further at Fermilab next week."


struct DynamicTypeDemos: View {
  
  var body: some View {
    NavigationView {
      List {
        Section {
          NavigationLink(
            "ScaledMetric",
            destination:
              ScaledMetricDemo()
              .navigationTitle("ScaledMetric")
              .navigationBarTitleDisplayMode(.inline)
          )
          NavigationLink(
            "Horizontal padding",
            destination:
              HorizontalPaddingDemo()
              .navigationTitle("Horizontal padding")
              .navigationBarTitleDisplayMode(.inline)
          )
          NavigationLink(
            "HStack adjustment",
            destination:
              HStackDemo()
              .navigationTitle("HStack adjustment")
              .navigationBarTitleDisplayMode(.inline)
          )
          NavigationLink(
            "ScrollView",
            destination:
              ScrollViewDemo()
              .navigationTitle("ScrollView")
              .navigationBarTitleDisplayMode(.inline)
          )
          NavigationLink(
            "Limit Dynamic Type Sizes",
            destination:
              LimitDynamicTypeSizesDemo()
              .navigationTitle("Limit Dynamic Type Sizes")
              .navigationBarTitleDisplayMode(.inline)
          )
          
        } footer: {
          Text("Slack Matt Argo with questions and thoughts. ♥︎")
        }
      }
      .navigationTitle("Dynamic Type Demos")
    }
    .accentColor(.orange)
  }
}


#Preview {
  DynamicTypeDemos()
}
