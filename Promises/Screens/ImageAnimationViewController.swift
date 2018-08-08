//
//  ImageAnimationViewController.swift
//  PromiseToPromise
//
//  Copyright © 2018 Michał Warchał. All rights reserved.
//

import UIKit
import PromiseKit

final class ImageAnimationViewController: UIViewController {
    
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
        guard let url = URL(string: "https://www.xyzarena.com/wp-content/uploads/2017/08/iOS-12-2-1-576x1024.jpg") else { return }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
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

