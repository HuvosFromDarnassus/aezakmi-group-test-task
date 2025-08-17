//
//  PINCodeView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 14/08/2025.
//

import SwiftUI

struct PINCodeView: View {
    
    // MARK: Properties

    @StateObject var viewModel: ConnectionViewModel
    @State private var pin: String = ""
    @FocusState private var inputActive: Bool
    private let pinLength = 6
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Color(.backgroundSecondary)
                .ignoresSafeArea()
            
            VStack {
                topTitles
                digitsRectangles
                optionalErrorText
                hiddenTextField
                
                Spacer()
            }
            .animation(.easeInOut(duration: 0.2), value: pin)
            .padding(20)
        }
    }
    
    // MARK: Views
    
    @ViewBuilder
    private var topTitles: some View {
        Text(Strings.Connection.Pairing.title)
            .font(Fonts.Roboto.semiBold.swiftUIFont(fixedSize: 20))
            .foregroundStyle(.textAndIcons)
            .padding(.bottom, 14)
        
        Text(Strings.Connection.Pairing.subtitle)
            .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 15))
            .foregroundStyle(.textAndIcons.opacity(0.5))
            .padding(.bottom, 18)
    }
    
    private var digitsRectangles: some View {
        HStack(spacing: 12) {
            ForEach(0..<pinLength, id: \.self) { index in
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.textAndIcons.opacity(0.15))
                        .frame(width: 50, height: 60)
                    
                    Text(getDigit(at: index))
                        .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 28))
                        .foregroundStyle(.textAndIcons)
                        .transition(.opacity)
                }
            }
        }
        .padding(.bottom, 20)
        .contentShape(Rectangle())
        .onTapGesture {
            inputActive = true
        }
    }
    
    @ViewBuilder
    private var optionalErrorText: some View {
        if let errorMessage = viewModel.errorMessage {
            Text(errorMessage)
                .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 15))
                .foregroundStyle(.accentPrimary)
                .transition(.opacity)
        }
    }
    
    private var hiddenTextField: some View {
        TextField("", text: $pin)
            .keyboardType(.numberPad)
            .focused($inputActive)
            .onChange(of: pin) { _, newValue in
                if newValue.count > pinLength {
                    pin = String(newValue.prefix(pinLength))
                }
                if newValue.count == pinLength {
                    inputActive = false
                    viewModel.set(pin: pin)
                }
            }
            .frame(width: 1, height: 1)
            .opacity(0.01)
    }
    
    // MARK: Private
    
    private func getDigit(at index: Int) -> String {
        guard index < pin.count else { return "" }
        let stringIndex = pin.index(pin.startIndex, offsetBy: index)
        return String(pin[stringIndex])
    }

}

// MARK: - Preview

#Preview {
    PINCodeView(viewModel: ConnectionViewModel())
}
