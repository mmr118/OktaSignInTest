//
//  OktaManager.swift
//  OktaSignInTest
//
//  Created by Monica Rondón on 22.03.24.
//  


import SwiftUI
import Combine

class OktaManager: ObservableObject {

    @Published var ephemeralSessionEnabled = false
    @Published var presentError = false

    @Published private(set) var signInError: Error?
    @Published private(set) var signedIn = false

    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {

        $signInError
            .map { $0 != nil }
            .assign(to: &$presentError)

        $ephemeralSessionEnabled
            .sink { _ in /*todo*/ }
            .store(in: &cancellableSet)
    }


    func signIn() {


    }
}
