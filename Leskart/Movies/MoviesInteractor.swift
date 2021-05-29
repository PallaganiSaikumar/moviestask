//
//  MoviesInteractor.swift
//  Leskart
//
//  Created by Sai Kumar on 29/05/21.
//

import UIKit

class MoviesInteractor: DataParsingLayer {
    
    weak var presenter: MoviesInteractorToPresenterDelegate?
    
    static func setupMoviesView() -> MoviesView? {
        // MoviesViewController instantiation
        guard let MoviesDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoviesViewController") as? MoviesView else { return nil }
        // Presenter instantiation
        let presenter: MoviesViewToPresenterDelegate & MoviesInteractorToPresenterDelegate = MoviesPresenter()
        MoviesDetailsViewController.presenter = presenter
        // Interactor instantiation
        let interactor: MoviesPresenterToInteractorDelegate = MoviesInteractor()
        interactor.presenter = presenter
        // Presenter Updation
        presenter.interactor = interactor
        presenter.view = MoviesDetailsViewController
        return MoviesDetailsViewController
    }
    
}

// MARK:- MoviesPresenter confirms to MoviesInteractorToPresenterDelegate
extension MoviesInteractor: MoviesPresenterToInteractorDelegate {
    
    func fetchAllMovies() {
        guard let moviesResponse = getMoviesDetailsResponse() else {
            presenter?.didFailedFetchMoviesData()
            return
        }
        presenter?.didFetchMoviesData(movies: moviesResponse)
    }
}
