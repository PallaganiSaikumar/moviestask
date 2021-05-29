//
//  SplashViewController.swift
//  Leskart
//
//  Created by Sai Kumar on 29/05/21.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let moviesViewController = MoviesInteractor.setupMoviesView() else { return }
        self.navigationController?.pushViewController(moviesViewController, animated: true)
    }
}
