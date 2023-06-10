//
//  UIView + Extension.swift
//  MovieApp
//
//  Created by admin on 10.06.2023.
//

import UIKit

extension UIView {
	 func makeBackground() {
		self.backgroundColor = .containerViewColor.withAlphaComponent(0.8)
		self.layer.cornerRadius = 10
	}
}
