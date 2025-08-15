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
    
    @StateObject private var viewModel = ConnectionViewModel()
    
    // MARK: Body

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.backgroundSecondary)
                    .ignoresSafeArea()
                
                if viewModel.showPinView {
                    PINCodeView(viewModel: viewModel)
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                } else {
                    contentView
                }
            }
            .animation(.easeInOut(duration: 0.3), value: viewModel.showPinView)
        }
    }
    
    // MARK: Private
    
    @ViewBuilder
    private var contentView: some View {
        VStack(alignment: .leading) {
            topTitles
            
            Spacer()
            
            if viewModel.isSearching {
                searchingState
            } else {
                deviceList
            }
        }
        .padding(16)
        .transition(.move(edge: .leading).combined(with: .opacity))
        .onAppear {
            viewModel.getDevices()
        }
        .alert(item: $viewModel.alertViewData) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                primaryButton: .cancel(),
                secondaryButton: .default(
                    Text(alert.actionTitle),
                    action: alert.action
                )
            )
        }
    }
    
    @ViewBuilder
    private var topTitles: some View {
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
    }
    
    @ViewBuilder
    private var searchingState: some View {
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
        
        HStack {
            Text(Strings.Connection.searching)
                .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 17))
                .foregroundStyle(.textAndIcons.opacity(0.5))
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private var deviceList: some View {
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
        .scrollIndicators(.automatic)
        .padding(.top, 8)
    }
    
}

// MARK: - Preview

#Preview {
    ConnectionView()
}
