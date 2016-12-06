import UIKit

class NetworkManager: NSObject {
    
    static func sendAsyncRequest(_ request: URLRequest,
                                             withCompletionHandler: ((_ response: URLResponse, _ data: Data)->Void)? = nil,
                                             errorHandler: ((_ response: URLResponse, _ data: Data, _ statusCode: Int)->Void)? = nil) {
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) { (requestResponse, requestData, requestError) -> Void in
            if requestError == nil {
                if requestData != nil {
                    if withCompletionHandler != nil {
                        withCompletionHandler!(requestResponse!, requestData!)
                    }
                }
            } else {
                print(requestError!)
                if errorHandler != nil {
                    errorHandler!(URLResponse(), Data(), -1)
                }
            }
        }
    }
    
    
}
