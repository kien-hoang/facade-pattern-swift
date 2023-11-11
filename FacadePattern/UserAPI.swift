//
//  UserAPI.swift
//  FacadePattern
//
//  Created by Kien Hoang on 11/11/2023.
//

import Foundation

protocol UserAPI {
  func getUserInfo() async throws
}

class DefaultUserAPI: UserAPI {
  func getUserInfo() async throws {
    print("Get user info from server!")
  }
}
