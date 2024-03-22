//
//  NMAOktaTestsApp.swift
//  NMAOktaTests
//
//  Created by Monica Rondón on 22.03.24.
//  


import SwiftUI

@main
struct NMAOktaTestsApp: App {

    var oktaManager: OktaManager = .init()

    var body: some Scene {
        WindowGroup {
            ContentView(oktaManager: oktaManager)
        }
    }
}
