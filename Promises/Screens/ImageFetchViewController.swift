//
//  ViewController.swift
//  PromiseToPromise
//
//  Copyright © 2018 Michał Warchał. All rights reserved.
//

import UIKit
import PromiseKit

final class ImageFetchViewController: UIViewController {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 100)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        downloadImage()
    }
    
    private func downloadImage() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url = URL(string: "https://iphonewalls.net/wp-content/uploads/2016/08/Forest%20River%20Crossing%20Mountain%20Fog%20iPhone%206+%20HD%20Wallpaper.jpg")!
        firstly {
            URLSession.shared.dataTask(.promise, with: url)
        }.compactMap { data, urlResponse in
            UIImage(data: data)
        }.done { image in
            self.imageView.image = image
            UIView.animate(.promise, duration: 0.5, animations: {
                self.imageView.frame = UIScreen.main.bounds
            })
        }.ensure {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }.catch { (error) in
            print(error)
        }
    }
}

