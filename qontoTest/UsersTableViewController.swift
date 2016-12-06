//
//  UsersTableViewController.swift
//  qontoTest
//
//  Created by ypeysale on 06/12/2016.
//  Copyright © 2016 ypeysale. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    var users : Array<User>?
    let userRestDAO = UserRestDAO()
    
    override func viewWillAppear(_ animated: Bool) {
        self.userRestDAO.getUsers(onUsersRetrieved, errorHandler:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (users != nil) {
            return users!.count
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        if (users != nil) {
            cell.nameLabel.text = users![indexPath.row].name
        }

        return cell
    }
    
    func onUsersRetrieved(users: Array<User>) {
        self.users = users
        self.tableView.reloadData()
    }


       /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
