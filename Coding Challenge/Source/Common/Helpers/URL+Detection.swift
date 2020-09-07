//
//  URL+Detection.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import Vision

public extension URL {
    func faceDetector() -> [VNFaceObservation]? {
        let faceDetect = VNDetectFaceRectanglesRequest()
        let detectionRequest = VNSequenceRequestHandler()
        
        try? detectionRequest.perform([faceDetect], onImageURL: self)
        return faceDetect.results as? [VNFaceObservation]
    }
}    


