//
//  ContentView.swift
//  NMAOktaTests
//
//  Created by Monica Rondón on 04.03.24.
//  


import SwiftUI

struct ContentView: View {

    @ObservedObject var oktaManager: OktaManager

    var body: some View {

        NavigationStack {

            VStack(spacing: 20) {

                Text("Have an account?")
                    .font(.title)
                    .padding()

                Button("Sign In") {

                }
                .buttonStyle(.borderedProminent)

                Button("Sign In with a refresh token") { /*no-op*/ }
                    .font(.subheadline)
                    .padding()


                Spacer()


                HStack {
                    Toggle("", isOn: $oktaManager.ephemeralSessionEnabled)
                        .labelsHidden()
                    Text("Ephemeral Session")
                }

                Text("Temporary Session")
                    .font(.footnote)
                    .italic()
                    .foregroundStyle(.secondary)


                HStack {
                    Text("Client ID:")
                    Text("xxx")
                }
                .font(.caption2)

            }.padding()
                .navigationTitle("NMA Okta Test")

        }
    }

}


// MARK: - Previews
#Preview {
    ContentView(oktaManager: OktaManager())
}


