//
//  APIError.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation
import Alamofire

enum ErrorMessageType: String, CaseIterable {
    case Generic
    case NoConnection
    case CallError
}

class APIError {
    private var errorMessage: String?
    private var type: ErrorMessageType = .Generic
    
    init(afError: AFError) {
        type = .CallError
        errorMessage = afError.localizedDescription
    }
    
    init(_ type: ErrorMessageType) {
        switch type {
        case .Generic: errorMessage = "generic_error".localized()
        case .NoConnection: errorMessage = "offline_error".localized()
        case .CallError: return
        }
    }
    
    func getMessage() -> String? {
        return errorMessage
    }
}
