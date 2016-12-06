import Foundation


public class UserParser {
    
    func parseUser(userJson: Dictionary<String, AnyObject>) -> User {
        let id = userJson["id"] as! Int
        let name = userJson["name"] as! String
        let userName = userJson["username"] as! String
        let email = userJson["email"] as! String
        
        return User(id: id, name: name, userName: userName, email: email)
    }
}
