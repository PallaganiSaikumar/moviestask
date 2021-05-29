//
//  MoviesPresenter.swift
//  Leskart
//
//  Created by Sai Kumar on 29/05/21.
//

import UIKit

class MoviesPresenter: NSObject {
    
    var dataSourceArray: [MovieTableViewCellViewModel] = []
    weak var view: MoviesPresenterToViewDelegate?
    var interactor: MoviesPresenterToInteractorDelegate?
    
    func mapMoviesResponseToViewModels(movies: Movies) -> [MovieTableViewCellViewModel] {
        return movies.compactMap { movieModel -> MovieTableViewCellViewModel? in
            return MovieTableViewCellViewModel(imageURLString: "http://image.tmdb.org/t/p/w92\(movieModel.posterPath ?? "")", title: movieModel.originalTitle, releaseDate: movieModel.releaseDate)
        }
    }
}

// MARK:- MoviesPresenter confirms to MoviesViewToPresenterDelegate
extension MoviesPresenter: MoviesViewToPresenterDelegate {
    
    func getDataSourceArray() -> [MovieTableViewCellViewModel] {
        return dataSourceArray
    }
    
   
    func getAllMoviesData() {
        interactor?.fetchAllMovies()
    }
}

// MARK:- MoviesPresenter confirms to MoviesInteractorToPresenterDelegate
extension MoviesPresenter: MoviesInteractorToPresenterDelegate {
    
    func didFetchMoviesData(movies: Movies) {
        let viewModels = mapMoviesResponseToViewModels(movies: movies)
        dataSourceArray = viewModels
        view?.releadData()
    }
    
    func didFailedFetchMoviesData() {
        // Present alert
    }
}
