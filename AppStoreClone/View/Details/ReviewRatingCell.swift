//
//  ReviewsCell.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/17/22.
//

import UIKit

class ReviewRatingCell: UICollectionViewCell {
	
	static let reuseId = String(describing: ReviewRatingCell.self)
	
	let reviewsRatingLabel = UILabel(text: "Review & Ratings", font: .boldSystemFont(ofSize: 20))
	let reviewsVC = ReviewsVC()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setUpViews()
	}
	
	required init?(coder: NSCoder) { fatalError() }
	
	
	private func setUpViews() {
		
		addSubview(reviewsRatingLabel)
		addSubview(reviewsVC.view)
		
		reviewsRatingLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
		
		reviewsVC.view.anchor(top: reviewsRatingLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
	}
}
