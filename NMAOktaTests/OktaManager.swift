//
//  OktaManager.swift
//  NMAOktaTests
//
//  Created by Monica Rondón on 22.03.24.
//  


import SwiftUI
import Combine
import WebAuthenticationUI

extension DateFormatter {

    static let userInfo: DateFormatter = {
        let result = DateFormatter()
        result.dateStyle = .medium
        result.timeStyle = .long
        return result
    }()
}


class OktaManager: ObservableObject {

    init() {

        init_signIn()
    }

    // MARK: Sign In Model
    @Published var ephemeralSessionEnabled = false
    @Published var presentError = false

    @Published private(set) var signInError: Error?
    @Published private(set) var signedIn_signIn = false

    private var cancellableSet_signIn: Set<AnyCancellable> = []

    func signIn() {


    }

    private func init_signIn() {
        $signInError
            .map { $0 != nil }
            .assign(to: &$presentError)

        $ephemeralSessionEnabled
            .sink { _ in /*todo*/ }
            .store(in: &cancellableSet_signIn)
    }


    // MARK: Profile Model
    @Published private(set) var signedIn_profile: Bool = true
    @Published private(set) var loadingUserInfo: Bool = true

    @Published private var userInfo: UserInfo?
    @Published private(set) var credential: Credential? {
        didSet { loadUserInfo(ifNeeded: credential != oldValue) }
    }

    private var cancellableSet_profile: Set<AnyCancellable> = []

    private func init_profile(credential: Credential?) {
        self.credential = credential

        $credential
            .map { $0 != nil }
            .assign(to: &$signedIn_signIn)

        $credential
            .sink { self.userInfo = $0?.userInfo }
            .store(in: &cancellableSet_profile)

        $userInfo
            .map { $0 == nil }
            .assign(to: &$loadingUserInfo)

        NotificationCenter.default.publisher(for: .defaultCredentialChanged, object: nil).compactMap { $0.object as? Credential }
            .sink { self.credential = $0 }
            .store(in: &cancellableSet_profile)

    }

    func removeUserInfo() {
        try? credential?.remove()
    }

    func revokeTokens() {
        credential?.revoke(type: .accessToken) { _ in
            DispatchQueue.main.async {
                self.credential = nil
            }
        }
    }

    private func loadUserInfo(ifNeeded needed: Bool = true) {
        guard needed, credential != nil else { return }

        credential?.userInfo { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                
                case .success(let userInfo):
                    self?.userInfo = userInfo
                    print(String(describing: userInfo))

                case .failure(let error):
                    self?.credential = nil
                    print(error.localizedDescription)

                }
            }
        }



    }
}
