//
//  Observable.swift
//  20220425-SivadattaKodali-NYCSchools
//
//  Created by Sivadatta Kodali on 4/26/22.
//

import Foundation

/// Observe and emit the value when change happens
class Observable<T>{
    var value : T? {
        didSet{
            listener?(value)
        }
    }
    
    init(_ value : T?){
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    /// Bind the listener and emit when the value changes.
    /// - Parameter listener: Block of code to excute when value changes.
    func bind(_ listener : @escaping(T?) -> Void) {
        self.listener = listener
    }
}
