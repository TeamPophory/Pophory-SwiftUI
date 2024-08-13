//
//  UIFontWithLineHeight.swift
//  pophory-TCA
//
//  Created by 강윤서 on 8/8/24.
//

import SwiftUI

enum Pretendard: String {
	case Bold = "Pretendard-Bold"
	case SemiBold = "Pretendard-SemiBold"
	case Medium = "Pretendard-Medium"
	case Regular = "Pretendard-Regular"
}

struct UIFontWithLineHeight {
	let font: UIFont
	let lineHeight: CGFloat
}

extension UIFontWithLineHeight {
	// Bold
	static let headline01Bold: UIFontWithLineHeight = customPretendard(.Bold, size: 24, lineHeight: 34)
	static let navBold: UIFontWithLineHeight = customPretendard(.Bold, size: 12, lineHeight: 14)
	static let popupTitleBold: UIFontWithLineHeight = customPretendard(.Bold, size: 19, lineHeight: 23)
	static let modalTitleBold: UIFontWithLineHeight = customPretendard(.Bold, size: 20, lineHeight: 28)
	
	// SemiBold
	static let headline02SemiBold: UIFontWithLineHeight = customPretendard(.Bold, size: 20, lineHeight: 24)
	static let headline03SemiBold: UIFontWithLineHeight = customPretendard(.Bold, size: 18, lineHeight: 17)
	
	// Medium
	static let headline01Medium: UIFontWithLineHeight = customPretendard(.Bold, size: 24, lineHeight: 34)
	static let title01Medium: UIFontWithLineHeight = customPretendard(.Bold, size: 17, lineHeight: 24)
	static let text01Medium: UIFontWithLineHeight = customPretendard(.Bold, size: 16, lineHeight: 21)
	static let caption01Medium: UIFontWithLineHeight = customPretendard(.Bold, size: 14, lineHeight: 20)
	static let caption02Medium: UIFontWithLineHeight = customPretendard(.Bold, size: 12, lineHeight: 17)
	static let popupButtonMedium: UIFontWithLineHeight = customPretendard(.Bold, size: 16, lineHeight: 23)
	static let popupLineMedium: UIFontWithLineHeight = customPretendard(.Bold, size: 14, lineHeight: 17)
	static let modalText: UIFontWithLineHeight = customPretendard(.Bold, size: 18, lineHeight: 26)
	
	// Regular
	static let popupTextRegular: UIFontWithLineHeight = customPretendard(.Bold, size: 16, lineHeight: 23)
}

// static func
extension UIFontWithLineHeight {
	
	/// custom font
	static func customPretendard(_ type: Pretendard, size: CGFloat, lineHeight: CGFloat) -> UIFontWithLineHeight {
		return uifontWithLineHeight(makeUIFont(type, size: size), lineHeight)
	}
	
	/// UIFont to UIFontWithLineHeight
	static func uifontWithLineHeight(_ font: UIFont, _ lineHeight: CGFloat) -> UIFontWithLineHeight {
		return UIFontWithLineHeight(font: font, lineHeight: lineHeight)
	}
	
	/// Font to UIFont
	static func makeUIFont(_ type: Pretendard, size: CGFloat) -> UIFont {
		return UIFont(name: type.rawValue, size: size)!
	}
}
