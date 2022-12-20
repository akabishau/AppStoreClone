//
//  ReviewRowCell.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/19/22.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
	
	static let reuseId = String(describing: ReviewRowCell.self)
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .systemBlue
	}
	
	required init?(coder: NSCoder) { fatalError() }
	
}
