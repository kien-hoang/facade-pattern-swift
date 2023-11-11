//
//  LoginView.swift
//  FacadePattern
//
//  Created by Kien Hoang on 11/11/2023.
//

import SwiftUI

struct LoginView: View {
  @StateObject private var vm = LoginViewModel()
  
  var body: some View {
    VStack {
      Button {
        Task {
          await vm.signIn()
        }
      } label: {
        Text("Sign In")
      }

    }
    .padding()
  }
}

#Preview {
  LoginView()
}
