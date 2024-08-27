//
//  View+.swift
//  pophory-TCA
//
//  Created by 강윤서 on 8/10/24.
//

import SwiftUI

extension View {
	func fontWithLineHeightView(fontType: UIFontWithLineHeight) -> some View {
		return ModifiedContent(
			content: self,
			modifier: FontWithLineHeightViewModifier(font: fontType.font, lineHeight: fontType.lineHeight))
	}
}
