//
//  TodayCell.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/25/22.
//

import UIKit

class TodayCell: UICollectionViewCell {
	
	static let reuseId = String(describing: TodayCell.self)
	
	let imageView = UIImageView(image: UIImage(systemName: "books.vertical"))
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setUpViews()
	}
	
	required init?(coder: NSCoder) { fatalError() }
	
	
	private func setUpViews() {
		print(#function)
		
		backgroundColor = .systemBackground
		layer.cornerRadius = 16
		
		addSubview(imageView)
		imageView.contentMode = .scaleAspectFill
		imageView.centerInSuperview(size: CGSize(width: 250, height: 250))
	}
}
