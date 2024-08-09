//
//  Font+.swift
//  pophory-TCA
//
//  Created by 강윤서 on 8/8/24.
//

import SwiftUI

extension Font {
	enum Pretendard: String {
		case Bold = "Pretendard-Bold"
		case SemiBold = "Pretendard-SemiBold"
		case Medium = "Pretendard-Medium"
		case Regular = "Pretendard-Regular"
	}
	
	
	// Bold
	static let headline01Bold: Font = .custom("Pretendard-Bold", size: 24)
	static let navBold: Font = .custom("Pretendard-Bold", size: 12)
	static let popupTitleBold: Font = .custom("Pretendard-Bold", size: 19)
	static let modalTitleBold: Font = .custom("Pretendard-Bold", size: 20)
	
	// SemiBold
	static let headline02SemiBold: Font = .custom("Pretendard-SemiBold", size: 20)
	static let headline03SemiBold: Font = .custom("Pretendard-SemiBold", size: 18)
	
	// Medium
	static let headline01Medium: Font = .custom("Pretendard-Medium", size: 24)
	static let title01Medium: Font = .custom("Pretendard-Medium", size: 16)
	static let text01Medium: Font = .custom("Pretendard-Medium", size: 14)
	static let caption01Medium: Font = .custom("Pretendard-Medium", size: 14)
	static let caption02Medium: Font = .custom("Pretendard-Medium", size: 12)
	static let popupButtonMedium: Font = .custom("Pretendard-Medium", size: 16)
	static let popupLineMedium: Font = .custom("Pretendard-Medium", size: 14)
	static let modalText: Font = .custom("Pretendard-Medium", size: 18)
	
	// Regular
	static let popupTextRegular: Font = .custom("Pretendard-Regular", size: 16)
	
	// custom font
	static func customPretendard(_ type: Pretendard, size: CGFloat) -> Font {
		return .custom(type.rawValue, size: size)
	}
}
