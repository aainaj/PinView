//
//  AnchorType.swift
//  PinView
//
//  Created by Jain, Aaina on 7/26/18.
//  Copyright © 2018 aaina. All rights reserved.
//

import Foundation

protocol AnchorType {
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    func prepareForConstraints()
    var owningView: View? { get }
}
