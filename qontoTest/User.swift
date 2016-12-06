import Foundation

public class User {
    var id : Int!
    var name : String!
    var userName : String!
    var email : String!
    
    init(id: Int, name: String, userName: String, email: String) {
        self.id = id
        self.name = name
        self.userName = userName
        self.email = email
    }
    
}
