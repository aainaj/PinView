//
//  View+PinToSuperviewAttributes.swift
//  PinView
//
//  Created by Jain, Aaina on 7/26/18.
//  Copyright © 2018 aaina. All rights reserved.
//

import Foundation
import UIKit

public extension View {
    func pinToSuperviewAttributes(constant: CGFloat = 0,
                             priority: Priority = Priority.required,
                             relatedBy relation: Relation = .equal) {
        if #available(iOS 11.0, *) {
            pinToSafeArea(relatedBy: relation)
        } else {
            pinToSuperview(attributes: [.top, .bottom, .leading, .trailing],
                           constant: constant,
                           priority: priority,
                           relatedBy: relation)
        }
    }
    
    func pinToSuperview(attributes: [Attribute],
                        constant: CGFloat = 0,
                        priority: Priority = Priority.required,
                        relatedBy relation: Relation = .equal) {
        for attribute in attributes {
            switch attribute {
            case .top: pinToSuperviewTop(constant: constant,
                                         priority: priority,
                                         relatedBy: relation)
            case .bottom: pinToSuperviewBottom(constant: constant,
                                               priority: priority,
                                               relatedBy: relation)
            case .leading: pinToSuperviewLeading(constant: constant,
                                                 priority: priority,
                                                 relatedBy: relation)
            case .trailing: pinToSuperviewTrailing(constant: constant,
                                                   priority: priority,
                                                   relatedBy: relation)
            default:
                preconditionFailure("Can't handle Center or Baseline attributes")
                break
            }
        }
    }
    
    @discardableResult func pinToSuperviewTop(
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        let constraint = makeConstraint(attribute: .top,
                                        constant: constant,
                                        priority: priority,
                                        relatedBy: relation)
        return constraint.activate()
    }
    
    @discardableResult func pinToSuperviewBottom(
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        let constraint = makeConstraint(attribute: .bottom,
                                        constant: -constant,
                                        priority: priority,
                                        relatedBy: relation)
        return constraint.activate()
    }
    
    @discardableResult func pinToSuperviewLeading(
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        let constraint = makeConstraint(attribute: .leading,
                                        constant: constant,
                                        priority: priority,
                                        relatedBy: relation)
        return constraint.activate()
    }
    
    @discardableResult func pinToSuperviewTrailing(
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        let constraint = makeConstraint(attribute: .trailing,
                                        constant: -constant,
                                        priority: priority,
                                        relatedBy: relation)
        return constraint.activate()
    }
    
    @discardableResult func pinToSuperviewCenterX(
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        let constraint = makeConstraint(attribute: .centerX,
                                               constant: constant,
                                               priority: priority,
                                               relatedBy: relation)
        return constraint.activate()
    }
    
    @discardableResult func pinToSuperviewCenterY(
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        let constraint = makeConstraint(attribute: .centerY,
                                               constant: constant,
                                               priority: priority,
                                               relatedBy: relation)
        return constraint.activate()
    }
    
    func pinToSuperviewCenter(
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) {
        pinToSuperviewCenterX(constant: constant, priority: priority, relatedBy: relation)
        pinToSuperviewCenterY(constant: constant, priority: priority, relatedBy: relation)
    }
    
    func pinToSafeArea(relatedBy relation: Relation = .equal) {
        guard let superview = superview else {
            fatalError("View has no superview")
        }
        prepareForConstraints()
        if #available(iOS 11.0, *) {
        let guide = superview.safeAreaLayoutGuide
        guide.makeConstraint(attribute: .top,
                             relatedBy: relation).activate()
        guide.makeConstraint(attribute: .bottom,
                             relatedBy: relation).activate()
        guide.makeConstraint(attribute: .leading,
                             relatedBy: relation).activate()
        guide.makeConstraint(attribute: .trailing,
                             relatedBy: relation).activate()
        }
    }
    
}
