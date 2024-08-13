//
//  ViewModifier+.swift
//  pophory-TCA
//
//  Created by 강윤서 on 8/10/24.
//

import SwiftUI

struct FontWithLineHeightViewModifier: ViewModifier {
	let font: UIFont
	let lineHeight: CGFloat
	
	func body(content: Content) -> some View {
		content
			.font(Font(font))
			.lineSpacing(lineHeight - font.lineHeight)
			.padding(.vertical, (lineHeight - font.lineHeight)/2)
	}
}
