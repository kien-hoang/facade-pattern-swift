//
//  LoginViewModel.swift
//  FacadePattern
//
//  Created by Kien Hoang on 12/11/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
  private let authAPI: AuthAPI
  private let userAPI: UserAPI
  
  init(
    authAPI: AuthAPI = ServiceFacade.getService(AuthAPI.self),
    userAPI: UserAPI = ServiceFacade.getService(UserAPI.self)
  ) {
    self.authAPI = authAPI
    self.userAPI = userAPI
  }

  func signIn() async {
    do {
      try await authAPI.signIn(username: "Kien Hoang", password: "123456")
      // Result: Sign in, Kien Hoang!
    } catch {
      // handle error here
    }
  }
}
