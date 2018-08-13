//
//  MultipleRequestsViewController.swift
//  Promises
//
//  Copyright © 2018 Michał Warchał. All rights reserved.
//

import UIKit
import PromiseKit

final class MultipleRequestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makePromiseChain()
    }
    
    private func makePromiseChain() {
        firstly {
            getUserAvatar()
        }.then { avatarStringUrl in
            URLSession.shared.dataTask(.promise, with: URL(string: avatarStringUrl)!)
        }.compactMap { data, urlResponse in
            UIImage(data: data)
        }.done { image in
            print(image)
        }
    }
}

extension MultipleRequestViewController {
    
    private func getUserAvatar() -> Promise<String> {
        return Promise { seal in
            guard let url = URL(string: "https://reqres.in/api/users/1") else { return }
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                guard let data = data, error == nil else { return }
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any],
                        let user = json["data"] as? [String: Any] else {
                            return
                    }
                    seal.fulfill(user["avatar"] as? String ?? "")
                } catch let error {
                    seal.reject(error)
                }
            }).resume()
        }
    }
}
