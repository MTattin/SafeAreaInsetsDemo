//
//  SwiftUIView.swift
//  SafeAreaInsetsDemo
//

import SwiftUI

struct SwiftUIView: View {

    var body: some View {
        HStack(alignment: .top, spacing: 0.0) {
            VStack(alignment: .leading, spacing: 0.0) {
                Text("SwiftUIで実装したタイトル部分")
                    .font(Font.title)
                    .lineSpacing(4)
                    .foregroundColor(.black)

                VStack(alignment: .leading, spacing: 8.0) {
                    makeListItem(
                        imageName: "book.closed.fill",
                        text: "SwiftUIで実装した説明部分１SwiftUIで実装した説明部分１"
                    )
                    .layoutPriority(3)
                    
                    makeListItem(
                        imageName: "trophy.circle.fill",
                        text: "SwiftUIで実装した説明部分２"
                    )
                    .layoutPriority(2)
                    
                    makeListItem(
                        imageName: "person.fill",
                        text: "SwiftUIで実装した説明部分３SwiftUIで実装した説明部分３"
                    )
                    .layoutPriority(1)
                }
                .padding(.top, 16.0)
            }
            Spacer(minLength: 0.0)
        }
        .background(Color.pink)
    }

    private func makeListItem(imageName: String, text: String) -> some View {
        HStack(alignment: .top, spacing: 16.0) {
            Image.init(systemName: imageName)
                .frame(width: 24.0, height: 24.0)
            makeListTextView(of: text)
        }
    }

    private func makeListTextView(of text: String) -> some View {
        Text(text)
            .font(.body)
            .lineSpacing(4)
            .foregroundColor(.secondary)
    }
}
