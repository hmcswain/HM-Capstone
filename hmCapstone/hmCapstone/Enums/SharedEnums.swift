//
//  SharedEnums.swift
//  hmCapstone
//

// SharedEnums.swift

/*

 import Foundation

 enum ActiveAlert {
 case saveAlert, clearAlert, dateChangeAlert
 }
 */

/*
 enum ActiveAlert: Identifiable {
 case saveAlert
 case clearAlert
 case dateChangeAlert

 // The computed property `id` makes ActiveAlert conform to Identifiable
 var id: String {
 switch self {
 case .saveAlert:
 return "saveAlert"
 case .clearAlert:
 return "clearAlert"
 case .dateChangeAlert:
 return "dateChangeAlert"
 }
 }
 }
 */


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
