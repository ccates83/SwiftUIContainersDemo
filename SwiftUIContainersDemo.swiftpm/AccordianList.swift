//
//  AccordianList.swift
//  SwiftUIContainersDemo
//
//  Created by Connor Cates on 10/8/24.
//
import SwiftUI

struct AccordianList: View {
    
    @State var expandedStep: String?
    
    var body: some View {
        List {
            let stepsArray = Array(STEPS.keys).sorted()
            ForEach(stepsArray, id: \.self) { step in
                AccordianListItem(
                    isExpanded: Binding<Bool>.init(
                        get: { step == expandedStep},
                        set: { _ in
                            withAnimation {
                                expandedStep = step == expandedStep ? nil : step
                            }
                        })
                ) {
                    Text(step)
                        .font(.headline)
                } expandedContent: {
                    if let substeps = STEPS[step] {
                        ForEach(substeps, id: \.self) { substep in
                            Text(substep)
                                .font(.subheadline)
                        }
                    }
                }
            }
        }.listStyle(.plain)
    }
}

struct AccordianListItem<LabelContent: View, ExpandedContent: View>: View {
    
    @Binding var isExpanded: Bool
    var label: LabelContent
    var expandedContent: ExpandedContent
    
    
    init(isExpanded: Binding<Bool>,
         @ViewBuilder label: () -> LabelContent,
         @ViewBuilder expandedContent: () -> ExpandedContent) {
        self._isExpanded = isExpanded
        self.label = label()
        self.expandedContent = expandedContent()
    }
    
    
    var body: some View {
        Section {
            if isExpanded {
                expandedContent
            }
        } header: {
            HStack {
                label
                Spacer()
                Button("Toggle Expanded") {
                    isExpanded.toggle()
                    print(isExpanded)
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}
