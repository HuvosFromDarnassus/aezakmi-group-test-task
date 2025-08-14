//
//  ConnectionView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

struct ConnectionView: View {
    
    // MARK: Properties
    
    @State private var isSearching = false
    
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
                
                if isSearching {
                    HStack {
                        Image(.connectSearching)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                } else {
                    List {
                        ForEach(0..<10) { index in
                            // TODO: Use device and connection status models to configure row
                            ConnectionItemRow(
                                name: index % 2 == 0 ? "Samsung TV" : "Smart TV name",
                                backgroundColor: index % 2 == 0 ? .accentPrimary : .backgroundSecondary,
                                statusText: index % 2 == 0 ? "Connected" : "Not connected",
                                statusTextColor: index % 2 == 0 ? .textAndIcons : .textAndIcons.opacity(0.5)
                            )
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                            .onTapGesture {
                                // code
                            }
                        }
                    }
                    .listStyle(.plain)
                    .scrollIndicators(.hidden)
                    .padding(.top, 8)
                }
                
                if isSearching {
                    HStack {
                        Text(Strings.Connection.searching)
                            .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 17))
                            .foregroundStyle(.textAndIcons.opacity(0.5))
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(16)
        }
    }

}

// MARK: - Preview

#Preview {
    ConnectionView()
}
