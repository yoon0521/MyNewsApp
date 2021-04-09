//
//  NewsCollectionsHeader.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/9/21.
//

import UIKit

class NewsCollectionsHeader: UICollectionReusableView, CellReusable {
    
  @IBOutlet private var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "Header"
            titleLabel.textColor = .white
            titleLabel.textAlignment = .left
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = bounds
    }
}
