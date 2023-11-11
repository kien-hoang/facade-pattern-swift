//
//  AuthAPI.swift
//  FacadePattern
//
//  Created by Kien Hoang on 11/11/2023.
//

import Foundation

protocol AuthAPI {
  func signIn(username: String, password: String) async throws
  func signUp(username: String, password: String) async throws
  func signOut() async throws
}

class DefaultAuthAPI: AuthAPI {
  func signIn(username: String, password: String) async throws {
    print("Sign in, \(username)!")
  }
  
  func signUp(username: String, password: String) async throws {
    print("Sign up, \(username)!")
  }
  
  func signOut() async throws {
    print("Sign out!")
  }
}

class MockAuthAPI: AuthAPI {
  func signIn(username: String, password: String) async throws {
    print("Mock sign in, \(username)!")
  }
  
  func signUp(username: String, password: String) async throws {
    print("Mock sign up, \(username)!")
  }
  
  func signOut() async throws {
    print("Mock sign out!")
  }
}
