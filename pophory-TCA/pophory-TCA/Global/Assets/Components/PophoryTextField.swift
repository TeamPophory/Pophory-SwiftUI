//
//  PophoryTextField.swift
//  pophory-TCA
//
//  Created by 강윤서 on 8/27/24.
//

import SwiftUI

struct PophoryTextFieldStyle: TextFieldStyle {
	func _body(configuration: TextField<Self._Label>) -> some View {
		configuration
			.padding(EdgeInsets(top: 19, leading: 15, bottom: 18, trailing: 18))
			.fontWithLineHeightView(fontType: .text01Medium)
			.overlay(
				RoundedRectangle(cornerRadius: 18)
					.stroke(.pryPurple, lineWidth: 1.0)
			)
			.onAppear {
				UITextField.appearance().clearButtonMode = .whileEditing
			}
	}
}

struct PophoryTextField: View {
	@State var text = ""
	
    var body: some View {
        TextField("Hi...", text: $text)
			.textFieldStyle(PophoryTextFieldStyle())
    }
}

#Preview {
    PophoryTextField()
}
