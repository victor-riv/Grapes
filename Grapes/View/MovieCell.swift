//
//  MovieCell.swift
//  Grapes
//
//  Created by Victor Rivera on 12/27/19.
//  Copyright © 2019 Victor Rivera. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    let posterImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let movieTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 13)
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .mainText
        return label
    }()
    
    let voteAverage: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 12)
        label.textColor = .secondaryText
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [posterImage, movieTitle, voteAverage].forEach() { addSubview($0) }
        
        posterImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, size: .init(width: 93, height: 0))
        movieTitle.anchor(top: topAnchor, leading: posterImage.trailingAnchor, padding: .init(top: 30, left: 15, bottom: 0, right: 0))
        voteAverage.anchor(top: topAnchor, leading: posterImage.trailingAnchor, padding: .init(top: 5, left: 230, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(movie: Movie) {
        if let url = URL(string: "http://image.tmdb.org/t/p/w92//\(movie.posterPath)") {
            do {
             let data = try Data(contentsOf: url)
                posterImage.image = UIImage(data: data)
            } catch {
                print("Something went wrong: \(error)")
            }
        } else {
            print("fuck")
        }
        movieTitle.text = movie.title
        voteAverage.text = "\(movie.voteAverage)"
    }
}
