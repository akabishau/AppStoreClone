//
//  AppsGroupCell.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/8/22.
//

import UIKit


class AppsGroupCell: UICollectionViewCell {
	
	static let reuseId = String(describing: AppsGroupCell.self)
	
	
	let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 30))
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .lightGray
		
		addSubview(titleLabel)
		titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
