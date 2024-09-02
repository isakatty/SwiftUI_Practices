//
//  MBTIModel.swift
//  SwiftUI_Practices
//
//  Created by Jisoo Ham on 9/2/24.
//

import Foundation

enum Energy: CaseIterable {
    case extrovert
    case introvert
    
    var toTitle: String {
        switch self {
        case .extrovert:
            return "E"
        case .introvert:
            return "I"
        }
    }
}

enum Recognition: CaseIterable {
    case sensing
    case intuition
    
    var toTitle: String {
        switch self {
        case .sensing:
            return "S"
        case .intuition:
            return "N"
        }
    }
}

enum Judgement: CaseIterable {
    case thinking
    case feeling
    
    var toTitle: String {
        switch self {
        case .thinking:
            return "T"
        case .feeling:
            return "F"
        }
    }
}
enum Life: CaseIterable {
    case judging
    case perceiving
    
    var toTitle: String {
        switch self {
        case .judging:
            return "J"
        case .perceiving:
            return "P"
        }
    }
}
