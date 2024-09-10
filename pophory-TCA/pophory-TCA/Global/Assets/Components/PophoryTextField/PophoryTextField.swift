//
//  PophoryTextField.swift
//  pophory-TCA
//
//  Created by 강윤서 on 8/27/24.
//

import SwiftUI

struct PophoryTextField: View {
	@State private var text: String = ""
	@State private var isValid: Bool = true
	let type: TextFieldType
	
	var body: some View {
		VStack {
			TextField(type.placeholder, text: $text)
				.onChange(of: text, { _, newValue in
					if newValue.count > type.maxCharacterLimit {
						text = String(newValue.prefix(type.maxCharacterLimit))
					}
					isValid = validate(newValue) || text.isEmpty
				})
				.textFieldStyle(PophoryTextFieldStyle(
					isEmpty: .constant(text.isEmpty),
					isValid: .constant(isValid))
				)
			
			HStack {
				if !isValid {
					Text(type.errorMessage)
						.fontWithLineHeightView(fontType: .caption01Medium)
						.padding(.leading, 6)
						.foregroundStyle(.pryRed)
				}
				
				Spacer()
				
				Text("(\(text.count)/\(type.maxCharacterLimit))")
					.fontWithLineHeightView(fontType: .text01Medium)
					.foregroundStyle(.gray400)
			}
			.padding(.top, 10)
		}
	}
	
	private func validate(_ text: String) -> Bool {
		let regex = try? NSRegularExpression(pattern: "^[A-Za-z0-9._]{4,12}$")
		let range = NSRange(location: 0, length: text.utf16.count)
		return regex?.firstMatch(in: text, options: [], range: range) != nil
	}
}

#Preview {
	PophoryTextField(type: .id)
}
