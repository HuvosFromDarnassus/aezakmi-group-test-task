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
    @State private var showInstructionView = false
    
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
            .onAppear {
                viewModel.getDevices()
            }
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
                    .transition(.opacity)
            } else if viewModel.devices.isEmpty {
                noDevicesState
                    .transition(.opacity)
            } else {
                deviceList
                    .transition(.opacity)
            }
        }
        .padding(16)
        .transition(.move(edge: .leading).combined(with: .opacity))
        .animation(.easeInOut(duration: 0.2), value: viewModel.isSearching)
        .sheet(isPresented: $showInstructionView) {
            showInstructionView = false
        } content: {
            InstructionView { showInstructionView = false }
                .presentationDetents([.fraction(0.999)])
                .presentationDragIndicator(.visible)
                .presentationBackground(.backgroundSecondary)
                .presentationCornerRadius(20)
                .presentationContentInteraction(.scrolls)
                .presentationCompactAdaptation(.none)
        }
        .alert(item: $viewModel.alertViewData) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                primaryButton: .cancel(),
                secondaryButton: .default(
                    Text(alert.actionTitle ?? ""),
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
            
            Button {
                showInstructionView = true
            } label: {
                Image(.questionMark)
            }
            .frame(width: 24, height: 24)
            .padding(.trailing, 16)
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
    private var noDevicesState: some View {
        HStack {
            Image(.connectEmpty)
        }
        .frame(maxWidth: .infinity)
        
        Spacer()
        
        HStack {
            ConnectionTryAgainView {
                viewModel.getDevices()
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private var deviceList: some View {
        List {
            ForEach(0..<viewModel.devices.count + 1, id: \.self) { index in
                if index < viewModel.devices.count {
                    let device = viewModel.devices[index]
                    ConnectionItemRow(name: device.name, status: device.status)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                        .onTapGesture {
                            viewModel.connect(to: device)
                        }
                } else {
                    ConnectionTryAgainView {
                        viewModel.getDevices()
                    }
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
