//
//  UIImageView+Bounds.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 07.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

extension UIImageView {
    var contentClippingRect: CGRect {
        guard let image = image else { return bounds }
        guard contentMode == .scaleAspectFit else { return bounds }
        guard image.size.width > 0, image.size.height > 0 else { return bounds }

        let scale: CGFloat
        if image.size.width > image.size.height {
            scale = bounds.width / image.size.width
        } else {
            scale = bounds.height / image.size.height
        }

        let size = CGSize(
            width: image.size.width * scale,
            height: image.size.height * scale)
        let x = (bounds.width - size.width) / 2.0
        let y = (bounds.height - size.height) / 2.0

        return CGRect(x: x, y: y, width: size.width, height: size.height)
    }

    func denormalized(_ normalizedRect: CGRect) -> CGRect {
        let imageSize = self.contentClippingRect.size
        let imageOrigin = self.contentClippingRect.origin

        let newOrigin = CGPoint(x: normalizedRect.minX * imageSize.width + imageOrigin.x, y: (1 - normalizedRect.maxY) * imageSize.height + imageOrigin.y)
        let newSize = CGSize(width: normalizedRect.width * imageSize.width, height: normalizedRect.height * imageSize.height)

        return CGRect(origin: newOrigin, size: newSize)
    }
}
