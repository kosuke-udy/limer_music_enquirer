import Foundation
import StoreKit

class AmSwiftApi: NSObject, AmNativeApi {
  func getUserAuthStatus() throws -> String {
    let status = SKCloudServiceController.authorizationStatus()
    switch status {
      case .denied: return "denied"
      case .notDetermined: return "notDetermined"
      case .restricted: return "restricted"
      case .authorized: return "authorized"
      default: 
        return "default result"
        break
    }
  }

  func requestUserAuth(completion: @escaping (Result<String, Error>) -> Void) {
    SKCloudServiceController.requestAuthorization { status in
      switch status {
        case .denied: completion(.success("denied"))
        case .notDetermined: completion(.success("notDetermined"))
        case .restricted: completion(.success("restricted"))
        case .authorized: completion(.success("authorized"))
        default: 
          completion(.success("default result"))
          break
      }
    }
  }

  func requestUserToken(devToken: String, completion: @escaping (Result<String, Error>) -> Void) {
    let controller = SKCloudServiceController()

    let requestCompletion: (String?, Error?) -> Void = { (token: String?, error: Error?) in
      if token != nil {
        completion(.success(token!))
      } else if error != nil {
        completion(.failure(error!))
        // switch error {
        //   case error as? SKError.privacyAcknowledgementRequired:
        //     completion(.failure(error!))
        //   default:
        //     completion(.failure(NSError(domain: "com.teamVinu", code: -1, userInfo: nil)))
        // }
      } else {
        completion(.failure(NSError(domain: "com.teamVinu", code: -1, userInfo: nil)))
      }
    }

    controller.requestUserToken(forDeveloperToken: devToken, completionHandler: requestCompletion)}
}