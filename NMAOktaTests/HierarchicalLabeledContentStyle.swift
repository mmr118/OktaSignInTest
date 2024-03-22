//
//  HierarchicalLabeledContentStyle.swift
//  NMAOktaTests
//
//  Created by Monica Rondón on 22.03.24.
//  


import SwiftUI

struct HierarchicalLabeledContentStyle: LabeledContentStyle {

    var label: HierarchicalShapeStyle? = nil
    var content: HierarchicalShapeStyle? = nil

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            if let style = label {
                configuration.label
                    .foregroundStyle(style)
            } else {
                configuration.label
            }

            Spacer()

            if let style = content {
                configuration.content
                    .foregroundStyle(style)
            } else {
                configuration.content
            }
        }

    }

}

// MARK: - LabeledContentStyle static accessors

extension LabeledContentStyle where Self == HierarchicalLabeledContentStyle {

    static func hierarchically(label: HierarchicalShapeStyle? = nil, content: HierarchicalShapeStyle? = nil) -> Self {
        return .init(label: label, content: content)
    }

    static var primarySecondary: Self { .init(label: .primary, content: .secondary) }

    static var secondaryPrimary: Self { .init(label: .secondary, content: .primary) }

}
