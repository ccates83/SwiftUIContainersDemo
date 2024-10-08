//
//  AccordianContainer.swift
//  SwiftUIContainersDemo
//
//  Created by Connor Cates on 10/8/24.
//

import SwiftUI

@available(iOS 18.0, *)
struct AccordianContainer<Content: View>: View {
    
    @ViewBuilder var content: Content
    
    @State var expandedSection: SectionCollection.Element.ID?
    
    var body: some View {
        List {
            // Get the sections of the passed in content
            Group(sections: content) { sections in
                ForEach(sections) { section in
                    // Grab the container values for the section
                    let values = section.containerValues
                    Group {
                        HStack {
                            // Use the container value to show if the step is complete
                            if values.stepIsComplete {
                                Image(systemName: "checkmark.circle.fill")
                            }
                            
                            section.header
                            
                            Spacer()
                            
                            // All sections in this custom container get the ability to expand
                            Button("Expand section") {
                                withAnimation {
                                    self.expandedSection = self.expandedSection == section.id ? nil : section.id
                                }
                            }.buttonStyle(.borderedProminent)
                        }
                        
                        // Display the expanded section
                        if self.expandedSection == section.id {
                            section.content
                        }
                    }
                    .padding()
                }
            }
        }.listStyle(.plain)
    }
}
