//
//  NewsCollectionViewCell.swift
//  ProxumerTesting
//
//  Created by Ton on 20/12/2563 BE.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func binding(for viewModel: NewsImage) {
        imageView.image = UIImage(named: viewModel.image)
    }
}
