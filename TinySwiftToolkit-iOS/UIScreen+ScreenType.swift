//
//  UIScreen+ScreenType.swift
//
//  Created by Eugene Melkov on 02.12.16.
//  Copyright © 2016 Eugene Melkov. All rights reserved.
//

/** This file contains information based on content from:
 http://iosres.com
 http://www.iphoneresolution.com
 */

import UIKit

enum ScreenType {
	case unknown
	///iPhone 4, 4S
	case iPhone4
	///iPhone 5, 5C, 5S, iPod Touch 5g, iPhone SE
	case iPhone5
	///iPhone 6, iPhone 6s, iPhone 7
	case iPhone6
	///iPhone 6 Plus, iPhone 6s Plus, iPhone 7 Plus
	case iPhonePlus
	///iPad, iPad 2, iPad Mini
	case iPad
	/** iPad Mini 2, iPad Mini 3, iPad Mini 4
		iPad 3, iPad 4, iPad Air, iPad Air 2, 9.7-inch iPad Pro
	*/
	case iPadRetina
	///12.9-inch iPad Pro
	case iPadPro129
	///Watch 38mm
	case watch38
	///Watch 42mm
	case watch42
	
	var size: CGSize {
		switch self {
		case .unknown: return CGSize.zero
		case .iPhone4: return CGSize(width: 640, height: 960)
		case .iPhone5: return CGSize(width: 640, height: 1136)
		case .iPhone6: return CGSize(width: 750, height: 1334)
		case .iPhonePlus: return CGSize(width: 1080, height: 1920) //CGSize(width: 1242, height: 2208)
		case .iPad: return CGSize(width: 768, height: 1024)
		case .iPadRetina: return CGSize(width: 1536, height: 2048)
		case .iPadPro129: return CGSize(width: 2048, height: 2732)
		case .watch38: return CGSize(width: 272, height: 340)
		case .watch42: return CGSize(width: 312, height: 390)
		}
	}
}

extension UIScreen {
	
	var screenType: ScreenType {
		let tmp: [ScreenType] = [.iPhone4, .iPhone5, .iPhone6, .iPhonePlus, .iPad, .iPadRetina, .iPadPro129, .watch38, .watch42]
		let height = self.nativeBounds.height
        #if swift(>=3.0)
            if let idx = tmp.index(where: { $0.size.height == height }) {
                return tmp[idx]
            }
        #else
            if let idx = tmp.indexOf({ $0.size.height == height }) {
                return tmp[idx]
            }
        #endif
		return .unknown
	}
	
	var isPhone4: Bool { return self.screenType == .iPhone4 }
	var isPhone5: Bool { return self.screenType == .iPhone5 }
	var isPhone6: Bool { return self.screenType == .iPhone6 }
	var isPhonePlus: Bool { return self.screenType == .iPhonePlus }
	var isPhone6Plus: Bool { return self.isPhonePlus } //compatibility
}

