//
//  PophoryButton.swift
//  pophory-TCA
//
//  Created by Joon Baek on 2024/08/09.
//

import SwiftUI

enum ButtonType {
    case standard
    case small
    case appleLogin
    
    var fontStyle: UIFontWithLineHeight {
        switch self {
        case .standard, .appleLogin:
            return .headline03SemiBold
        case .small:
            return .text01Medium
        }
    }
    
    var height: CGFloat {
        switch self {
        case .standard, .appleLogin:
            return 60
        case .small:
            return 47
        }
    }
    
    var isAppleLogin: Bool {
        self == .appleLogin
    }
    
    func setTextColor(for backgroundColor: Color) -> Color {
        switch self {
        case .standard:
            return backgroundColor == .white ? .pryPurple : .white
        case .small, .appleLogin:
            return .white
        }
    }
}

struct PophoryButtonStyle: ButtonStyle {
    let type: ButtonType
    let backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, minHeight: type.height)
            .background(backgroundColor)
            .foregroundColor(type.setTextColor(for: backgroundColor))
            .cornerRadius(30)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

struct PophoryButton: View {
    let type: ButtonType
    let title: String
    let action: () -> Void
    let backgroundColor: Color
    
    var body: some View {
        Button(action: action) {
                Group {
                    if type.isAppleLogin {
                        appleLoginContent()
                    } else {
                        Text(title)
                            .fontWithLineHeightView(fontType: type.fontStyle)
                    }
                }
        }
        .buttonStyle(PophoryButtonStyle(type: type, backgroundColor: backgroundColor))
    }
}

extension PophoryButton {
    private func appleLoginContent() -> some View {
        HStack {
            Image(systemName: "apple.logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.leading, 20)
            
            Spacer()
            
            Text(title)
                .fontWithLineHeightView(fontType: type.fontStyle)
            
            Spacer()
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        PophoryButton(type: .standard, title: "포포리 버튼", action: {},  backgroundColor: .pryBlack)
        PophoryButton(type: .appleLogin, title: "Apple ID로 시작하기", action: {},  backgroundColor: .pryBlack)
        PophoryButton(type: .standard, title: "화이트 버튼", action: {}, backgroundColor: .white)
        PophoryButton(type: .small, title: "작은 버튼 블랙", action: {},  backgroundColor: .pryBlack)
        PophoryButton(type: .small, title: "작은 버튼 그레이", action: {},  backgroundColor: .gray400)
    }
    .padding(20)
    .background(Color.gray300)
    .cornerRadius(30)
}
