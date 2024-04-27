//  SharedEnums.swift

import Foundation

enum ActiveAlert: Identifiable {
  case saveAlert, clearAlert, none
  var id: Int {
    switch self {
    case .saveAlert:
      return 1
    case .clearAlert:
      return 2
    case .none:
      return 0
    }
  }
}
