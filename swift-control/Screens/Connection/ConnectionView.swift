//
//  ConnectionView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

import Lottie

struct ConnectionView: View {
    
    // MARK: Properties
    
    @ObservedObject private var viewModel = ConnectionViewModel()
    
    // MARK: Body

    var body: some View {
        ZStack {
            Color(.backgroundSecondary)
                .ignoresSafeArea()

            VStack(alignment: .leading) {
                HStack {
                    Text(Strings.Connection.title)
                        .font(Fonts.Roboto.semiBold.swiftUIFont(fixedSize: 20))
                        .foregroundStyle(.textAndIcons)
                    Spacer()
                    Image(.questionMark)
                }
                Text(Strings.Connection.subtitle)
                    .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 15))
                    .foregroundStyle(.textAndIcons.opacity(0.5))
                
                Spacer()
                
                if viewModel.isSearching {
                    HStack {
                        if let animation = viewModel.getSearchAnimation() {
                            LottieView(animation: animation)
                                .playing(loopMode: .loop)
                        } else {
                            Image(.connectSearching)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    Spacer()
                } else {
                    List {
                        ForEach(viewModel.devices, id: \.id) { device in
                            ConnectionItemRow(name: device.name, status: device.status)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                            .onTapGesture {
                                viewModel.connect(to: device)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .scrollIndicators(.hidden)
                    .padding(.top, 8)
                }
                
                if viewModel.isSearching {
                    HStack {
                        Text(Strings.Connection.searching)
                            .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 17))
                            .foregroundStyle(.textAndIcons.opacity(0.5))
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(16)
            .onAppear {
                viewModel.getDevices()
            }
        }
    }

}

// MARK: - Preview

#Preview {
    ConnectionView()
}
