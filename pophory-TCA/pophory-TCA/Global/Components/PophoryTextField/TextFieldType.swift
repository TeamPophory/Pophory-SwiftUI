//
//  TextFieldType.swift
//  pophory-TCA
//
//  Created by 강윤서 on 9/10/24.
//

enum TextFieldType {
	case id
	case nickName
	
	var placeholder: String {
		switch self {
		case .id:
			return "아이디"
		case .nickName:
			return "닉네임"
		}
	}
	
	var regex: String {
		switch self {
		case .id:
			return "^[a-zA-Z0-9._]{4,12}$"
		case .nickName:
			return "^[가-힣]{2,6}$"
		}
	}
	
	var errorMessage: String {
		switch self {
		case .id:
			return "*올바른 형식의 아이디가 아닙니다"
		case .nickName:
			return "*2-6글자 이내로 작성해주세요"
		}
	}
	
	var maxCharacterLimit: Int {
		switch self {
		case .id:
			return 12
		case .nickName:
			return 6
		}
	}
}
