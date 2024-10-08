import SwiftUI

@available(iOS 18.0, *)
struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Old way") {
                    AccordianList()
                }
                NavigationLink("New way") {
                    // Create the container
                    AccordianContainer {
                        ForEach(Array(STEPS.keys.sorted()), id: \.self) { step in
                            // Create sections with a header and content for the step with substeps
                            Section {
                                if let substeps = STEPS[step] {
                                    ForEach(substeps, id: \.self) { substep in
                                        Text(substep)
                                            .font(.subheadline)
                                    }
                                }
                            } header: {
                                Text(step)
                                    .font(.headline)
                            }
                            // Attach the container value if the step is complete
                            .stepIsComplete(Bool.random())
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI Containers")
        }
    }
}
