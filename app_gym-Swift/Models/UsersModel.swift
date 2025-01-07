//
//  usersData.swift
//  app_gym-Swift
//
//  Created by Martin Aguilar on 07/01/2025.
//

import Foundation

struct UsersModel {
    let id: Int
    let nombre: String
    let apellido: String
    let email: String
    let rol: String
    let estado: Bool
    let fechaRegistro: String?

    init(from userData: UsersDatum) {
        self.id = userData.id ?? 0
        self.nombre = userData.nombre ?? "Sin Nombre"
        self.apellido = userData.apellido ?? "Sin Apellido"
        self.email = userData.email ?? "Sin Email"
        self.rol = userData.rol ?? "Sin Rol"
        self.estado = userData.estado ?? false
        self.fechaRegistro = userData.fechaRegistro
    }
}
