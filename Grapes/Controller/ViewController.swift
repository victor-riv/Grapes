//
//  ViewController.swift
//  Grapes
//
//  Created by Victor Rivera on 12/27/19.
//  Copyright © 2019 Victor Rivera. All rights reserved.
//

import UIKit

private let cellIdentifier = "MovieCell"

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .mainBackground
        
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        MovieStore.instance.decodeMovies()
    }

}

extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MovieCell {
            cell.backgroundColor = .cellBackground
            cell.layer.cornerRadius = 5
            cell.updateCell(movie: MovieStore.instance.getMovies()[indexPath.row])
        return cell
        } else {
            return MovieCell()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieStore.instance.getMovies().count
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 25), height: 150)
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing {
            trailing.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let mainBackground = UIColor.rgb(red: 224, green: 225, blue: 244)
    static let cellBackground = UIColor.rgb(red: 246, green: 246, blue: 254)
    static let mainText = UIColor.rgb(red: 66, green: 56, blue: 108)
    static let secondaryText = UIColor.rgb(red: 127, green: 119, blue: 159)
}


