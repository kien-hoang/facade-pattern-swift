//
//  FacadePatternApp.swift
//  FacadePattern
//
//  Created by Kien Hoang on 11/11/2023.
//

import SwiftUI

@main
struct FacadePatternApp: App {
  
  init() {
    ServiceFacade.initializeContainer()
//    ServiceFacade.initializeMockContainer()
  }
  
  var body: some Scene {
    WindowGroup {
      LoginView()
    }
  }
}
