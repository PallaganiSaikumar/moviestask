//
//  MoviesDataTransferProtocols.swift
//  Leskart
//
//  Created by Sai Kumar on 29/05/21.
//

import Foundation

// MARK:- MoviesViewToPresenterDelegate Delegate
protocol MoviesViewToPresenterDelegate: class {
    // Exposed properties
    var interactor: MoviesPresenterToInteractorDelegate? { get set }
    var view: MoviesPresenterToViewDelegate? { get set }

    func getAllMoviesData()
    func getDataSourceArray() -> [MovieTableViewCellViewModel]
}

// MARK:- MoviesPresenterToViewProtocol Delegate
protocol MoviesPresenterToViewDelegate: class {
    func releadData()
}

// MARK:- MoviesPresenterToInteractor Delegate
protocol MoviesPresenterToInteractorDelegate: class {
    // Exposed properties
    var presenter: MoviesInteractorToPresenterDelegate? { get set }
    func fetchAllMovies()
}

// MARK:- MoviesInteractorToPresenter Delegate
protocol MoviesInteractorToPresenterDelegate: class {
    func didFetchMoviesData(movies: Movies)
    func didFailedFetchMoviesData()
}
