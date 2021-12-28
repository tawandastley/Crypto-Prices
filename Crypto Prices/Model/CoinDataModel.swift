//
//  CoinDataModel.swift
//  Crypto Prices
//
//  Created by tawanda chandiwana on 2021/12/28.
//

import Foundation
struct CoinDataModel {
    var dollarValue: Double
    
    var dollarString : String {
        let dollarStringValue = String(format: "%.2f", dollarValue)
        return "$\(dollarStringValue)"
        
    }
    
    var poundValue: String{
        let poundValue = dollarValue * 0.74
        let poundStringValue = String(format: "%.2f", poundValue)
        
        return "£\(poundStringValue)"
    }
    var yuanValue: String {
        let yuanValue = dollarValue * 6.37
        let yuanStringvalue = String(format: "%.2f", yuanValue)
        
        return "¥\(yuanStringvalue)"
    }
    var randValue : String {
        let randValue = dollarValue * 15.37
        let randStringValue = String(format: "%.2f", randValue)
        print(randStringValue)
        return "R\(randStringValue)"
    }
}
