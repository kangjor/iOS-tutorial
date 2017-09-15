//
//  TipModel.swift
//  Tipsy
//
//  Created by Kenneth Kang on 15/09/2017.
//  Copyright © 2017 Kenneth Kang. All rights reserved.
//

import Foundation

class TipModel {
    // MARK: Properties
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _tipAmount: Double = 0
    private var _totalAmount: Double = 0
    private var _split: Int = 0
    private var _splitTotal: Double = 0
    
    // set getter and setter
    var billAmount: Double {
        get {
            return _billAmount
        } set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipPercent
        } set {
            _tipPercent = newValue
        }
    }
    
    var split: Int {
        get {
            return _split
        } set {
            _split = newValue
        }
    }
    
    var tipAmount: Double {
        return _tipAmount
    }
    
    var totalAmount: Double {
        return _totalAmount
    }
    
    var splitTotal: Double {
        return _splitTotal
    }
    
    // MARK: Initialization
    init(billAmount: Double, tipPercent: Double, split: Int) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
        self._split = split
    }
    
    // MARK: functions
    func calculateTip() {
        _tipAmount = _billAmount * _tipPercent
        _totalAmount = _billAmount + _tipAmount
        _splitTotal = _totalAmount / Double(_split)
    }
}
