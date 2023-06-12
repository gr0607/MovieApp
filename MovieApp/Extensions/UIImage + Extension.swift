//
//  UIImage + Extension.swift
//  MovieApp
//
//  Created by admin on 12.06.2023.
//

import UIKit

extension UIImage{

	class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
		UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

		let graphicsContext = UIGraphicsGetCurrentContext()
		graphicsContext?.setFillColor(color)

		let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
		graphicsContext?.fill(rectangle)

		let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return rectangleImage!
	}
}
