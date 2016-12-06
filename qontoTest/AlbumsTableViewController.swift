//
//  AlbumsTableViewController.swift
//  qontoTest
//
//  Created by ypeysale on 06/12/2016.
//  Copyright © 2016 ypeysale. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {

    var userId : Int!
    var albums : Array<Album>?
    let albumsRestDAO = AlbumsRestDAO()
    
    override func viewWillAppear(_ animated: Bool) {
       self.albumsRestDAO.getUserAlbums(userId: userId, onAlbumsRetrieved, errorHandler:nil) 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (albums != nil) {
            return albums!.count
        } else {
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumCell
        if (albums != nil) {
            cell.albumNameLabel.text = albums![indexPath.row].title
        }
        
        return cell
    }

    func onAlbumsRetrieved(albums: Array<Album>) {
        self.albums = albums
        self.tableView.reloadData()
    }

}
