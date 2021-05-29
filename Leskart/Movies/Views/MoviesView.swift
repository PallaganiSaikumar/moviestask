//
//  ViewController.swift
//  Leskart
//
//  Created by Sai Kumar on 29/05/21.
//

import UIKit

class MoviesView: UIViewController {
    
    // MARK: Constants
    struct ViewConstants {
        static let movieCellReuseIdentifier = "MovieTableViewCell"
    }
    
    // MARK: Outlets
    @IBOutlet weak var moviesTableView: UITableView!
    
    // MARK: Properties
    var presenter: MoviesViewToPresenterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.getAllMovies()
    }
    
    private func registerCell() {
        moviesTableView.register(UINib(nibName: ViewConstants.movieCellReuseIdentifier, bundle: nil), forCellReuseIdentifier: ViewConstants.movieCellReuseIdentifier)
    }
    
    func getAllMovies() {
        presenter?.getAllMoviesData()
    }
}

// MARK:- MoviesView confirms to UITableViewDataSource & UITableViewDelegate
extension MoviesView: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getDataSourceArray().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dataSource = presenter?.getDataSourceArray()
        
        guard let moviesCell = tableView.dequeueReusableCell(withIdentifier: ViewConstants.movieCellReuseIdentifier) as? MovieTableViewCell else { return UITableViewCell() }
        moviesCell.setupCell(model: dataSource?[indexPath.row])
        
        return moviesCell
    }
}

// MARK:- MoviesView confirms to MoviesPresenterToViewDelegate
extension MoviesView: MoviesPresenterToViewDelegate {
    
    func releadData() {
        moviesTableView.reloadData()
    }
}
