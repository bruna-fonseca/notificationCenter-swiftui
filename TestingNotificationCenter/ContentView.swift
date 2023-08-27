//
//  ContentView.swift
//  TestingNotificationCenter
//
//  Created by Bruna Marques De Oliveira Fonseca on 27/08/23.
//

import SwiftUI

struct ContentView: View {
    let notificationName = Notification.Name("notificationTest")
    @State var color: Color? = nil

    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    AnotherPage()
                } label: {
                    Text("Go to another page")
                        .frame(width: 300, height: 40)
                        .background(.cyan)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color ?? .white)
            .onReceive(NotificationCenter.default.publisher(for: notificationName)) { obj in
                if let userInfo = obj.userInfo, let info = userInfo["info"] {
                    color = info as? Color
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
