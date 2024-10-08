//
//  ContainerValues+isCompleted.swift
//  SwiftUIContainersDemo
//
//  Created by Connor Cates on 10/8/24.
//
import SwiftUI

@available(iOS 18.0, *)
extension ContainerValues {
    @Entry var stepIsComplete: Bool = false
}

@available(iOS 18.0, *)
extension View {
    func stepIsComplete(_ isCompleted: Bool) -> some View {
        containerValue(\.stepIsComplete, isCompleted)
    }
}
