//
//  Constraint+Activate.swift
//  PinView
//
//  Created by Jain, Aaina on 7/26/18.
//  Copyright © 2018 aaina. All rights reserved.
//

import Foundation

extension Constraint {
    
    @discardableResult func activate() -> Constraint {
        self.isActive = true
        return self
    }
    
}
