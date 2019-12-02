//
//  CollectionExtension.swift
//  Starlordtech
//
//  Created by Johnny Chang on 2019/11/29.
//  Copyright © 2019 starlordtech. All rights reserved.
//

import UIKit

public extension Collection where Indices.Iterator.Element == Index {
    subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

public extension Array {
    
    subscript (exist index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
