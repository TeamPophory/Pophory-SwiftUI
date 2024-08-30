//
//  PophoryTextField.swift
//  pophory-TCA
//
//  Created by 강윤서 on 8/27/24.
//

import SwiftUI

struct PophoryTextFieldStyle: TextFieldStyle {
	@Binding var isEmpty: Bool
	
	func _body(configuration: TextField<Self._Label>) -> some View {
		configuration
			.padding(EdgeInsets(top: 19, leading: 15, bottom: 18, trailing: 18))
			.fontWithLineHeightView(fontType: .text01Medium)
			.overlay(
				RoundedRectangle(cornerRadius: 18)
					.stroke(isEmpty ? .gray300 : .pryPurple, lineWidth: 1.0)
			)
			.onAppear {
				UITextField.appearance().clearButtonMode = .whileEditing
			}
	}
}

struct PophoryTextField: View {
	@State private var text: String = ""
	let placeholder: String
	
	var body: some View {
		TextField(placeholder, text: $text)
			.textFieldStyle(PophoryTextFieldStyle(isEmpty: .constant(text.isEmpty))
		)
	}
}

#Preview {
	PophoryTextField(placeholder: "Enter")
}
