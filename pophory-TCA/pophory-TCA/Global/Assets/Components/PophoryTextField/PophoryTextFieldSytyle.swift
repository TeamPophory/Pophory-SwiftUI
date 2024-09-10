//
//  PophoryTextFieldSytyle.swift
//  pophory-TCA
//
//  Created by 강윤서 on 9/10/24.
//

import SwiftUI

struct PophoryTextFieldStyle: TextFieldStyle {
	@Binding var isEmpty: Bool
	@Binding var isValid: Bool
	
	func _body(configuration: TextField<Self._Label>) -> some View {
		configuration
			.padding(EdgeInsets(top: 19, leading: 15, bottom: 18, trailing: 18))
			.fontWithLineHeightView(fontType: .text01Medium)
			.overlay(
				RoundedRectangle(cornerRadius: 18)
					.stroke(strokeColor(), lineWidth: 1.0)
			)
			.onAppear {
				UITextField.appearance().clearButtonMode = .whileEditing
			}
	}
	
	private func strokeColor() -> Color {
		if isEmpty {
			return .gray300
		} else if isValid {
			return .pryPurple
		} else {
			return .pryRed
		}
	}
}
