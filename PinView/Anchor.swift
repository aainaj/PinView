//
//  Anchor.swift
//  PinView
//
//  Created by Jain, Aaina on 7/26/18.
//  Copyright © 2018 aaina. All rights reserved.
//

import Foundation

public enum Attribute {
    case top
    case bottom
    case centerY
    case leading
    case trailing
    case centerX
    case lastBaseline
    case firstBaseline
    case width
    case height
    
    func layoutAnchor(for item: AnchorType) -> LayoutAnchor<AnyObject> {
        switch self {
        case .top:
            let topAnchor = item.topAnchor as LayoutAnchor<NSLayoutYAxisAnchor>
            guard let anchor = topAnchor as? LayoutAnchor<AnyObject> else {
                preconditionFailure("Top anchor can't be return")
            }
            return anchor
        case .bottom:
            let bottomAnchor = item.bottomAnchor as LayoutAnchor<NSLayoutYAxisAnchor>
            guard let anchor = bottomAnchor as? LayoutAnchor<AnyObject> else {
                preconditionFailure("Bottom anchor can't be return")
            }
            return anchor
        case .centerY:
            let centerYAnchor = item.centerYAnchor as LayoutAnchor<NSLayoutYAxisAnchor>
            guard let anchor = centerYAnchor as? LayoutAnchor<AnyObject> else {
                preconditionFailure("CenterY anchor can't be return")
            }
            return anchor
        case .leading:
            let leadingAnchor = item.leadingAnchor as LayoutAnchor<NSLayoutXAxisAnchor>
            guard let anchor = leadingAnchor as? LayoutAnchor<AnyObject> else {
                preconditionFailure("Leading anchor can't be return")
            }
            return anchor
        case .trailing:
            let trailingAnchor = item.trailingAnchor as LayoutAnchor<NSLayoutXAxisAnchor>
            guard let anchor = trailingAnchor as? LayoutAnchor<AnyObject> else {
                preconditionFailure("Trailing anchor can't be return")
            }
            return anchor
        case .centerX:
            let centerXAnchor = item.centerXAnchor as LayoutAnchor<NSLayoutXAxisAnchor>
            guard let anchor = centerXAnchor as? LayoutAnchor<AnyObject> else {
                preconditionFailure("CenterX anchor can't be return")
            }
            return anchor
        case .lastBaseline:
            let centerXAnchor = item.centerXAnchor as LayoutAnchor<NSLayoutXAxisAnchor>
            guard let anchor = centerXAnchor as? LayoutAnchor<AnyObject> else {
                preconditionFailure("CenterX anchor can't be return")
            }
            return anchor
        case .firstBaseline:
            let centerXAnchor = item.centerXAnchor as LayoutAnchor<NSLayoutXAxisAnchor>
            guard let anchor = centerXAnchor as? LayoutAnchor<AnyObject> else {
                preconditionFailure("CenterX anchor can't be return")
            }
            return anchor
        case .width:
            let widthAnchor = item.widthAnchor as LayoutAnchor<NSLayoutDimension>
            guard let anchor = widthAnchor as? LayoutAnchor<AnyObject> else {
                preconditionFailure("width anchor can't be return")
            }
            return anchor
        case .height:
            let heightAnchor = item.heightAnchor as LayoutAnchor<NSLayoutDimension>
            guard let anchor = heightAnchor as? LayoutAnchor<AnyObject> else {
                preconditionFailure("height anchor can't be return")
            }
            return anchor
        }
    }
}
