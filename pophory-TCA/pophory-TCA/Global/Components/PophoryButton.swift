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
    
    var dimensions: (width: CGFloat, height: CGFloat) {
        switch self {
        case .standard, .appleLogin:
            return (335, 60)
        case .small:
            return (248, 47)
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
            .frame(width: type.dimensions.width, height: type.dimensions.height)
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
            GeometryReader { geometry in
                HStack {
                    if type.isAppleLogin {
                        appleLoginContent(geometry)
                    } else {
                        Text(title)
                            .fontWithLineHeightView(fontType: type.fontStyle)
                    }
                }
                // buttonLabel 쏠림 방지
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .buttonStyle(PophoryButtonStyle(type: type, backgroundColor: backgroundColor))
    }
}

extension PophoryButton {
    private func appleLoginContent(_ geometry: GeometryProxy) -> some View {
        HStack {
            Image(systemName: "apple.logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.leading, 20)
            
            Spacer()
                .frame(width: geometry.size.width * 0.1)
            
            Text(title)
                .fontWithLineHeightView(fontType: type.fontStyle)
                .frame(maxWidth: .infinity)
            
            Spacer()
                .frame(width: geometry.size.width * 0.2)
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
