import UIKit
import Flutter
import MusicKit
import StoreKit
import Foundation

class AppleMusicNativeApiImpl: NSObject, AppleMusicNativeApi {
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

  func fetchMultipleLibraryTrackData(ids: [String], completion: @escaping (Result<[LibraryTrackData], Error>) -> Void) {
    Task {
        let status = await SKCloudServiceController.authorizationStatus()
        if (status != SKCloudServiceAuthorizationStatus.authorized) {
            let auth = await SKCloudServiceController.requestAuthorization()
            if (auth != SKCloudServiceAuthorizationStatus.authorized) {
                completion(.failure(NSError(domain: "com.teamVinu", code: -1, userInfo: nil)))
                return
            }
        }

        var ret: [LibraryTrackData] = [] 

        for id in ids {
            do {
                var request = MusicLibraryRequest<Song>()
                request.filter(matching: \.id, equalTo: MusicItemID(id))
                let response = try await request.response() 

                let song = response.items.first!

                ret.append(
                    LibraryTrackData(
                        succeeded: true,
                        id: song.id.rawValue,
                        composerName: song.composerName ?? nil,
                        lastPlayedDate: AppUtil.date2FormatedInt32(date: song.lastPlayedDate),
                        libraryAddedDate: AppUtil.date2FormatedInt32(date: song.libraryAddedDate)!,
                        playCount: Int32(song.playCount ?? 0)
                    )
                )
            } catch {
                ret.append(LibraryTrackData(
                    succeeded: false, 
                    errorMessage: error.localizedDescription,
                    id: id, 
                    composerName: "",
                    lastPlayedDate: nil,
                    libraryAddedDate: -1,
                    playCount: -1
                ))
            }
        }
        completion(.success(ret))
    }
  }
}