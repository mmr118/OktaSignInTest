//
//  UserInfoView.swift
//  NMAOktaTests
//
//  Created by Monica Rondón on 22.03.24.
//  


import SwiftUI
import WebAuthenticationUI


extension UserInfo {
    static let mock: UserInfo = .init([String : Any]())
}

struct UserInfoView: View {

    var userInfo: UserInfo

    var body: some View {

        Form {

            Text("UserInfo")
                .bold()
                .listRowSeparator(.hidden)

            detailView("Given name", value: userInfo.givenName ?? "nil")
            LabeledContent("Family name", value: userInfo.familyName ?? "nil")
            LabeledContent("Locale", value: userInfo.userLocale?.identifier ?? "nil")
            LabeledContent("Timezone", value: userInfo.timeZone?.identifier ?? "nil")
            LabeledContent("Username", value: userInfo.preferredUsername ?? "nil")
            LabeledContent("User ID (subject)", value: userInfo.subject ?? "nil")
            if let updatedAt = userInfo.updatedAt {
                LabeledContent("Created At", value: updatedAt, format: .dateTime)
            } else {
                LabeledContent("Created At", value: "nil")
            }
        }
        .labeledContentStyle(.secondaryPrimary)
    }


    @ViewBuilder private func detailView(_ title: String, value: String? = nil) -> some View {
        let valueStr = value ?? "nil"
        LabeledContent(title, value: valueStr)
    }
}


// MARK: - Previews

#Preview {

    UserInfoView(userInfo: .mock)

}
