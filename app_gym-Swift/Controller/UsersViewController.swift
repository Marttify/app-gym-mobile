//
//  ViewController.swift
//  app_gym-Swift
//
//  Created by Martin Aguilar on 06/01/2025.
//


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableViewUser: UITableView!
    
    var usersManager = UsersManager()
    var users: [UsersModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewUser.delegate = self
        tableViewUser.dataSource = self
        
        usersManager.fetchUsers { [weak self] users in
            DispatchQueue.main.async {
                if let users = users {
                    self?.users = users
                    print(users)
                    self?.tableViewUser.reloadData()
                } else {
                    print("No se pudieron obtener los usuarios")
                }
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = users[indexPath.row]
        
        cell.textLabel?.text = "\(user.nombre) \(user.apellido) - \(user.email)"
        cell.contentView.backgroundColor = .lightGray
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = .systemFont(ofSize: 13)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        print("Seleccionaste: \(user.nombre) \(user.apellido) - \(user.email)")
    }
}
