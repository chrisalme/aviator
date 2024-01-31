//
//  AddNewModel.swift
//  aviator
//
//  Created by apple on 25.01.2024.
//

import Foundation
import UIKit


struct AddNewModel: Decodable {
    let duration: Int
    let startDate: String
    let event: String
    let reservations: [EventReservation]
    let id: String
}

// MARK: - Reservation
struct EventReservation: Decodable {
    let id: String
    let seat: Int
    let event, userID: String
    let status: EventStatus
    
    enum CodingKeys: String, CodingKey {
        case id, seat, event
        case userID = "userId"
        case status
    }
}
enum EventStatus: String, Decodable {
    case free
    case reserved
    case reservedByMe
    
    var color: UIColor {
        switch self {
            case .free: return .green
            case .reserved: return .red
            case .reservedByMe: return .yellow
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)

        switch rawValue {
        case "free": self = .free
        case "reserved": self = .reserved
        case "reservedByMe": self = .reservedByMe
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown EventStatus value: \(rawValue)")
        }
    }
}
