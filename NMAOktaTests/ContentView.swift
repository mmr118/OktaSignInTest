//
//  ContentView.swift
//  NMAOktaTests
//
//  Created by Monica Rondón on 04.03.24.
//


import SwiftUI
import Combine

struct ContentView: View {

    @State var signedIn = false

    @ObservedObject var oktaManager: OktaManager

    var body: some View {
        if signedIn {
            ProfileView()
                .environmentObject(oktaManager)
        } else {
            LoginView()
                .environmentObject(oktaManager)
        }
    }

}


// MARK: - Previews
#Preview {
    ContentView(oktaManager: OktaManager())
}


