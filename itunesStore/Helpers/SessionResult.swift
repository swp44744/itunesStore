//
//  SessionResult.swift
//  demo
//
//  Created by Swapnil Raut on 7/24/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import Foundation

/// Generic enum to store restful respons state
enum SessionResult<T, E> {
  case success(T)
  case failure(E)
}
