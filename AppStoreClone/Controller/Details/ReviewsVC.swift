//
//  ReviewsVC.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/18/22.
//

import UIKit

class ReviewsVC: BaseListVC {
	
	var reviews: ReviewResult? {
		didSet {
			collectionView.reloadData()
		}
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: ReviewCell.reuseId)
		collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
		
		if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
			layout.scrollDirection = .horizontal
		}
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return reviews?.feed.entry.count ?? 0
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let review = reviews?.feed.entry[indexPath.item]
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCell.reuseId, for: indexPath) as! ReviewCell
		cell.titleLabel.text = review?.title.label
		cell.authorLabel.text = review?.author.name.label
		cell.bodyLabel.text = review?.content.label
		
		return cell
	}
}


extension ReviewsVC: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return .init(width: view.frame.width - 48, height: view.frame.height)
	}
	
	
	// default spacing is 10,
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 16
	}
}
