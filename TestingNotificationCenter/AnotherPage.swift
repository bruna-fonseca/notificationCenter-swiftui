//
//  AnotherPage.swift
//  TestingNotificationCenter
//
//  Created by Bruna Marques De Oliveira Fonseca on 27/08/23.
//

import SwiftUI

struct AnotherPage: View {
    var body: some View {
        VStack {
            Text("ANOTHER PAGE")
        }
        .onDisappear(perform: self.observerPost)
    }

    func observerPost() {
        NotificationCenter.default.post(name: NSNotification.Name("notificationTest"), object: nil, userInfo: ["info": Color.red])
    }
}
