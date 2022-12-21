//
//  ReviewRowCell.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/19/22.
//

import UIKit

class ReviewCell: UICollectionViewCell {
	
	static let reuseId = String(describing: ReviewCell.self)
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .systemBlue
	}
	
	required init?(coder: NSCoder) { fatalError() }
	
}
