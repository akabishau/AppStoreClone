//
//  UILabel+Ext.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/8/22.
//

import UIKit


extension UILabel {
	
	// the most repeatable label initiation
	
	convenience init(text: String, font: UIFont) {
		self.init(frame: .zero)
		self.text = text
		self.font = font
	}
}
