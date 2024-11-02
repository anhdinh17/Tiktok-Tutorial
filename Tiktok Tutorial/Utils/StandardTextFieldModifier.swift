//
//  StandardTextFieldModifier.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/2/24.
//

import Foundation
import SwiftUI

struct StandardTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
