//
//  UsersManager.swift
//  app_gym-Swift
//
//  Created by Martin Aguilar on 06/01/2025.
//


import Foundation

struct UsersManager {
    let USERS_URL: String = "http://localhost:3001/get-usuarios"
    
    func fetchUsers(completion: @escaping ([UsersModel]?) -> Void) {
        performRequest(with: USERS_URL, completion: completion)
    }

    private func performRequest(with urlString: String, completion: @escaping ([UsersModel]?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("URL inválida: \(urlString)")
            completion(nil)
            return
        }

        // Crear la sesión
        let session = URLSession(configuration: .default)

        // Asignar tarea
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error en la tarea: \(error.localizedDescription)")
                completion(nil)
                return
            }

            // Validar respuesta HTTP
            if let httpResponse = response as? HTTPURLResponse {

                if httpResponse.statusCode != 200 {
                    print("Error: Código de estado inesperado \(httpResponse.statusCode)")
                    completion(nil)
                    return
                }
            }

            // Validar datos
            guard let safeData = data else {
                print("Error: Datos nulos recibidos")
                completion(nil)
                return
            }


            // Parsear datos
            if let usersData = self.parseJSON(usersData: safeData) {
                completion(usersData)
            } else {
                print("Error al parsear los datos")
                completion(nil)
            }
        }

        // Iniciar la tarea
        task.resume()
    }

    private func parseJSON(usersData: Data) -> [UsersModel]? {
        let decoder = JSONDecoder()
        do {
            let users = try decoder.decode(UsersData.self, from: usersData)

            let userModels = users.map {
                UsersModel(from: $0)
            }
            return userModels
        } catch {
            print("Error al decodificar JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
