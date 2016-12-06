import Foundation


public class AlbumParser {
    
    func parseAlbum(albumJson: Dictionary<String, AnyObject>) -> Album {
        let id = albumJson["id"] as! Int
        let title = albumJson["title"] as! String
        
        return Album(id: id, title: title)
    }
}
