//
//  UserInfoView.swift
//  NMAOktaTests
//
//  Created by Monica Rondón on 22.03.24.
//  


import SwiftUI
import WebAuthenticationUI

struct UserInfoView: View {

    var userInfo: UserInfo?

    @State var presentSignOutAlert = false

    var body: some View {
        if let userInfo = userInfo {
            Form {

                Text("UserInfo")
                    .bold()
                    .listRowSeparator(.hidden)

                LabeledContent("Given name", value: userInfo.givenName ?? "nil")
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
        } else {
            ContentUnavailableView("No UserInfo found.", image: "person.fill.questionmark")
        }

    }

}


// MARK: - Previews

#Preview {

    UserInfoView(userInfo: nil)

}
