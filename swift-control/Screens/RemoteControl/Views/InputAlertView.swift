//
//  InputAlertView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 15/08/2025.
//

import SwiftUI

struct InputAlertView: View {

    // MARK: Properties
    
    @Binding var isPresented: Bool
    let title: String
    let onSubmit: (String) -> Void
    
    @State private var text: String = "192.168.1.1"

    // MARK: Body
    
    var body: some View {
        if isPresented {
            ZStack {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isPresented = false
                    }

                VStack(spacing: 16) {
                    Text(title)
                        .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 17))
                        .foregroundStyle(.accentSecondary)
                        .multilineTextAlignment(.center)

                    TextField("192.168.1.1", text: $text)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numbersAndPunctuation)
                        .padding(.horizontal)

                    HStack {
                        Button("Cancel") {
                            isPresented = false
                        }
                        Spacer()
                        Button("Submit") {
                            isPresented = false
                            onSubmit(text)
                        }
                    }
                    .foregroundStyle(.accentSecondary)
                    .padding(.horizontal)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .frame(maxWidth: 300)
            }
        }
    }

}

#Preview {
    InputAlertView(
        isPresented: Binding(projectedValue: .constant(true)),
        title: "Введите IP компьютера, на котором запущен эмулятор LG TV."
    ){ _ in }
}
