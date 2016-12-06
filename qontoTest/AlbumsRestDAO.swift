import Foundation


public class AlbumsRestDAO {
    func getUserAlbums(userId: Int, _ completionHandler: ((_ users: Array<Album>)->Void)? = nil,
                  errorHandler: ((_ response: URLResponse, _ data: Data, _ statusCode: Int)->Void)? = nil) {
        
        let albumsURL = String(format:Constants.albumsURL, userId)
        
        let request = URLRequest(url: URL(string:albumsURL)!)
        
        NetworkManager.sendAsyncRequest(request, withCompletionHandler: { (response, data) in
            
            let albumsData = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Array<AnyObject>
            var albums = Array<Album>()
            let albumParser = AlbumParser()
            
            if let albumssDataDictionary = albumsData as? Array<Dictionary<String, AnyObject>> {
                for albumJson:Dictionary<String, AnyObject> in albumssDataDictionary {
                    let albumRead = albumParser.parseAlbum(albumJson: albumJson)
                    albums.append(albumRead)
                }
                
                if (completionHandler != nil) {
                    completionHandler!(albums)
                }
            }
            
        }) { (response, data, statusCode) in
            //TODO
        }
        
        
        
    }
    
}
