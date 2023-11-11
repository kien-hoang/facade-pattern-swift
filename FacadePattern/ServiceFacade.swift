//
//  ServiceFacade.swift
//  FacadePattern
//
//  Created by Kien Hoang on 11/11/2023.
//

import Foundation
import Swinject

enum ServiceFacade {
  private static let container = Container()
  private static let threadSafeContainer: Resolver = container.synchronize()
  
  /// Register dependency injection here
  static func initializeContainer() {
    registerShared(AuthAPI.self) { _ in
      DefaultAuthAPI()
    }
    registerShared(UserAPI.self) { _ in
      DefaultUserAPI()
    }
  }

  /// Register mock dependency injection here
  static func initializeMockContainer() {
    registerShared(AuthAPI.self) { _ in
      MockAuthAPI()
    }
    registerShared(UserAPI.self) { _ in
      DefaultUserAPI()
    }
  }
}

extension ServiceFacade {
  static func getService<T>(_ type: T.Type, name: String? = nil) -> T {
    return threadSafeContainer.getService(type, name: name)
  }
  
  @discardableResult
  private static func registerShared<T>(
    _ type: T.Type,
    name: String? = nil,
    factory: @escaping (Resolver) -> T
  ) -> ServiceEntry<T> {
    return container
      .register(type, name: name, factory: factory)
      .inObjectScope(.container)
  }
}

fileprivate extension Resolver {
  func getService<T>(_ type: T.Type, name: String? = nil) -> T {
    guard let service = resolve(type, name: name) else {
      fatalError("Service \(type) is NOT registered")
    }
    return service
  }
}
