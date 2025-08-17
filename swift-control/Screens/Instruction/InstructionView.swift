//
//  InstructionView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 15/08/2025.
//

import SwiftUI

struct InstructionView: View {
    
    // MARK: Propertied
    
    let onClose: (() -> Void)?

    // MARK: Body
    
    var body: some View {
        ZStack {
            Color(.backgroundSecondary)
                .ignoresSafeArea()
            
            closeButton
                .padding(.top, 20)
            
            VStack {
                Text(Strings.Instruction.title)
                    .font(Fonts.Roboto.semiBold.swiftUIFont(fixedSize: 20))
                    .foregroundStyle(.textAndIcons)
                
                List(InstructionViewData.allCases, id: \.self) {
                    InstructionItemRow(instruction: $0)
                }
                .listStyle(.plain)
            }
            .padding(.top, 20)
        }
    }
    
    // MARK: Views
    
    private var closeButton: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    onClose?()
                } label: {
                    Image(.close)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                        .background(.textAndIcons.opacity(0.2))
                        .clipShape(Circle())
                }
                .frame(width: 24, height: 24)
                .padding(.trailing, 16)
            }
            Spacer()
        }
    }

}

#Preview {
    InstructionView {}
}
