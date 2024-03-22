//
//  ContentView.swift
//  NMAOktaTests
//
//  Created by Monica Rondón on 04.03.24.
//


import SwiftUI
import Combine

struct ContentView: View {

    @ObservedObject var oktaManager: OktaManager

    @State private var cancellableSet: Set<AnyCancellable> = []

    @State var showDetail = false

    var ephemeralSessionToggle: some View {
        VStack(spacing: 6) {
            HStack {
                Toggle("", isOn: $oktaManager.ephemeralSessionEnabled)
                    .labelsHidden()
                Text("Ephemeral Session")
            }

            HStack(spacing: 2) {
                Image(systemName: "info.circle")
                Text("Temporary Session")
            }
            .font(.system(size: 10, weight: .thin, design: .default))
            .foregroundStyle(.secondary)
        }

    }

    var body: some View {

        NavigationStack {

            VStack(spacing: 20) {

                Text("Have an account?")
                    .font(.title)
                    .padding()

                Button("Sign In") {
                    oktaManager.signIn()
                }
                .buttonStyle(.borderedProminent)

                NavigationLink("Detail", destination: UserInfoView(userInfo: .mock))

                Button("Sign In with a refresh token") { /*no-op*/ }
                    .font(.subheadline)
                    .padding()


                Spacer()
                
                ephemeralSessionToggle

                HStack {
                    Text("Client ID:")
                    Text("xxx")
                }
                .font(.caption)

            }
            .padding()
            .navigationTitle("NMA Okta Test")
            .onAppear {

                // subscribe
//                oktaManager.$signedIn
//                    .sink { self.$signedIn.wrappedValue = $0 }
//                    .store(in: &self.cancellableSet)
            }

        }
    }


}


// MARK: - Previews
#Preview {
    ContentView(oktaManager: OktaManager())
}


