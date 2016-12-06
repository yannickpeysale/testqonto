import Foundation


public class UserRestDAO {
    
    func getUsers(_ completionHandler: ((_ users: Array<User>)->Void)? = nil,
                         errorHandler: ((_ response: URLResponse, _ data: Data, _ statusCode: Int)->Void)? = nil) {
        
        let request = URLRequest(url: URL(string: Constants.usersURL)!)
        
        NetworkManager.sendAsyncRequest(request, withCompletionHandler: { (response, data) in
            
            let usersData = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Array<AnyObject>
            var users = Array<User>()
            let userParser = UserParser()
            
            if let usersDataDictionary = usersData as? Array<Dictionary<String, AnyObject>> {
                for userJson:Dictionary<String, AnyObject> in usersDataDictionary {
                    let userRead = userParser.parseUser(userJson: userJson)
                    users.append(userRead)
                }
                
                if (completionHandler != nil) {
                    completionHandler!(users)
                }
            }
            
        }) { (response, data, statusCode) in
            //TODO
        }
        
        
        
    }
    
}
