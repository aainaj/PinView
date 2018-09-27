//
//  View+Prepare.swift
//  PinView
//
//  Created by Jain, Aaina on 7/26/18.
//  Copyright © 2018 aaina. All rights reserved.
//

import Foundation

extension View: AnchorType {
  
    public func prepareForConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    var owningView: View? {
        return superview
    }
    
}

extension UILayoutGuide: AnchorType {}

extension AnchorType {
    
    public func prepareForConstraints() { }
    
}
