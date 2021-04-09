//
//  NewsCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/8/21.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell, CellReusable {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var publishedLabel: UILabel!
    @IBOutlet private var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.makeRoundRectangle()
    }
    
    func configure(data: NewsElements) {
        titleLabel.text = data.title
        publishedLabel.text = "Published at \(getDateFrom(publishedAt: data.publishedAt))"
        imageView.downloadImage(with: data.imageUrl)
    }
}

extension NewsCollectionViewCell {
    func getDateFrom(publishedAt: String) -> String {
         String(publishedAt.prefix(10))
    }
}
