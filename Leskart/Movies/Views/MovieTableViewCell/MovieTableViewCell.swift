//
//  MovieTableViewCell.swift
//  Leskart
//
//  Created by Sai Kumar on 29/05/21.
//

import UIKit
import SDWebImage

struct MovieTableViewCellViewModel {
    let imageURLString: String?
    let title: String?
    let releaseDate: String?
}

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    // MARK: Setup cell
    func setupCell(model: MovieTableViewCellViewModel?) {
        guard let modelUW = model else { return }
        setImageURL(imagePath: modelUW.imageURLString)
        titleLabel.text = modelUW.title
        releaseDateLabel.text = modelUW.releaseDate
    }
    
    // MARK: Setup image
    private func setImageURL(imagePath: String?) {
        guard let imagePathUW = imagePath, let imageURL = URL(string: imagePathUW) else { return }
        movieImageView.sd_setImage(with: imageURL, placeholderImage: #imageLiteral(resourceName: "moviePlaceholder"))
    }
}
