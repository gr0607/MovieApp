//
//  UIColor + Extension.swift
//  MovieApp
//
//  Created by admin on 05.06.2023.
//

import UIKit

extension UIColor {

	static func rgb(redColor: CGFloat, greenColor: CGFloat, blueColor: CGFloat, alpha: CGFloat) -> UIColor {
			return UIColor(red: redColor/255, green: greenColor/255, blue: blueColor/255, alpha: alpha)
	}

	static func colorFromRGB(_ rgbValue: Int) -> UIColor! {
			return UIColor(
					red: CGFloat((Float((rgbValue & 0xff0000) >> 16)) / 255.0),
					green: CGFloat((Float((rgbValue & 0x00ff00) >> 8)) / 255.0),
					blue: CGFloat((Float((rgbValue & 0x0000ff) >> 0)) / 255.0),
					alpha: 1.0)
	}

	static let mainThemeColor = UIColor(red: 0.08, green: 0.08, blue: 0.12, alpha: 1)
	static let containerViewColor = UIColor.rgb(redColor: 208, greenColor: 208, blueColor: 208, alpha: 1)
	static let ultraWhiteColor = UIColor.rgb(redColor: 250, greenColor: 253, blueColor: 255, alpha: 1)
	static let subWhiteColor = UIColor.rgb(redColor: 225, greenColor: 225, blueColor: 225, alpha: 1)
	static let separatorViewColor = UIColor(red: 81, green: 81, blue: 81, alpha: 0.1)
}
