//
//  usersData.swift
//  app_gym-Swift
//
//  Created by Martin Aguilar on 07/01/2025.
//

import Foundation

// MARK: - UsersDatum
struct UsersDatum: Codable {
    let id: Int?
    let nombre, apellido, email, contraseña: String?
    let rol, fechaRegistro: String?
    let estado: Bool?

    enum CodingKeys: String, CodingKey {
        case id, nombre, apellido, email, contraseña, rol
        case fechaRegistro = "fecha_registro"
        case estado
    }
}

typealias UsersData = [UsersDatum]
