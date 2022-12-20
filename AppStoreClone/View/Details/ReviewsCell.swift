//
//  ReviewsCell.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/17/22.
//

import UIKit

class ReviewsCell: UICollectionViewCell {
	
	static let reuseId = String(describing: ReviewsCell.self)
	
	let reviewsVC = ReviewsVC()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setUpViews()
	}
	
	required init?(coder: NSCoder) { fatalError() }
	
	
	private func setUpViews() {
		
		addSubview(reviewsVC.view)
		reviewsVC.view.fillSuperview()
	}
}
