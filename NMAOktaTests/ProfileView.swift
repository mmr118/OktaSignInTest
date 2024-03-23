//
//  ProfileView.swift
//  NMAOktaTests
//
//  Created by Monica Rondón on 22.03.24.
//  


import SwiftUI
import Combine

struct ProfileView: View {

    @EnvironmentObject var oktaManager: OktaManager

    @State var presentSignOutAlert: Bool = false
    @State var cancellableSet: Set<AnyCancellable> = []

    var body: some View {
        VStack {

            if oktaManager.loadingUserInfo {
                ProgressView("Loading UserInfo")
            } else {
                UserInfoView(userInfo: oktaManager.userInfo)
            }


            Button("Sign Out") {
                presentSignOutAlert.toggle()
            }
            .alert(isPresented: $presentSignOutAlert) {
                Alert(title: Text("Sign out"), primaryButton: .default(Text("Yes"), action: oktaManager.revokeTokens), secondaryButton: .cancel())
            }
            .padding()
        }
        .onAppear {
//            oktaManager.$signedIn_profile
//                .sink { }
        }
    }

}


// MARK: - Previews

#Preview {
    ProfileView()
        .environmentObject(OktaManager())
}
