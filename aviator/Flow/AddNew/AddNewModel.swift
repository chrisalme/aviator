//
//  AddNewModel.swift
//  aviator
//
//  Created by apple on 25.01.2024.
//

import Foundation
import UIKit

struct AddNewModel: Decodable {
    let id: String
    let event: String
    let startData: String
    let duration: String
    let reservations: [EventReservation]
}

struct EventReservation: Decodable {
    let id: Int
    let status: String
    
}

enum EventStatus {
    case free
    case reserved
    case reservedByMy
    
    var color: UIColor {
        switch self {
            case .free: return .green
            case .reserved: return .yellow
            case .reservedByMy: return .red
        }
    }
}
