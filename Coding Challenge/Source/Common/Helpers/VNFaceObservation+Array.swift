//
//  VNFaceObservation+Array.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import Vision

extension Array where Element: VNFaceObservation {
    
    func maxArea() -> CGFloat {
        self.max{ $0.boundingBox.area < $1.boundingBox.area }?.boundingBox.area ?? 0.0
    }
    
}
