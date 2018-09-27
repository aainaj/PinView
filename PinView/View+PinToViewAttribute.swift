//
//  View+PinToViewAttribute.swift
//  PinView
//
//  Created by Jain, Aaina on 7/29/18.
//  Copyright © 2018 aaina. All rights reserved.
//
import Foundation
import UIKit

public extension View {
    
    func pinToAttributes(of view: View,
                         constant: CGFloat = 0,
                         priority: Priority = Priority.required,
                         relatedBy relation: Relation = .equal) {
        pin(attributes: [.top, .bottom, .leading, .trailing],
            to: view,
            constant: constant,
            priority: priority,
            relatedBy: relation)
    }
    
    func pin(attributes: [Attribute],
               to view: View,
               constant: CGFloat = 0,
               priority: Priority = Priority.required,
               relatedBy relation: Relation = .equal) {
        for attribute in attributes {
            switch attribute {
            case .top: pinTop(to: view,
                              constant: constant,
                              priority: priority,
                              relatedBy: relation)
            case .bottom: pinBottom(to: view,
                                 constant: constant,
                                 priority: priority,
                                 relatedBy: relation)
            case .leading: pinLeading(to: view,
                                  constant: constant,
                                  priority: priority,
                                  relatedBy: relation)
            case .trailing: pinTrailing(to: view,
                                   constant: constant,
                                   priority: priority,
                                   relatedBy: relation)
            default:
                preconditionFailure("Can't handle Center or Baseline attributes")
                break
            }
        }
    }
    
    @discardableResult func pinTop(
        to view: UIView,
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        return pin(attribute: .top, of: view, constant: constant, priority: priority, relatedBy: relation)
    }
    
    @discardableResult func pinBottom(
        to view: UIView,
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        return pin(attribute: .bottom, of: view, constant: constant, priority: priority, relatedBy: relation)
    }
    
    @discardableResult func pinLeading(
        to view: UIView,
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        return pin(attribute: .leading, of: view, constant: constant, priority: priority, relatedBy: relation)
    }
    
    @discardableResult func pinTrailing(
        to view: UIView,
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        return pin(attribute: .trailing, of: view,
                   constant: constant, priority: priority, relatedBy: relation)
    }
    
    func pinCenter(to view: UIView) {
        pinCenterX(to: view).activate()
        pinCenterY(to: view).activate()
    }
    
    @discardableResult func pinCenterX(
        to view: UIView,
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        return pin(attribute: .centerX, of: view,
                   constant: constant, priority: priority, relatedBy: relation)
    }
    
    @discardableResult func pinCenterY(
        to view: UIView,
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        return pin(attribute: .centerY, of: view,
                   constant: constant, priority: priority, relatedBy: relation)
    }
    
    @discardableResult public func pin(
        attribute: Attribute,
        of view: View,
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        let constraint = pin(attribute: attribute,
                             to: attribute,
                             of: view,
                             constant: constant,
                             priority: priority,
                             relatedBy: relation)
        return constraint.activate()
    }
    
    @discardableResult public func pin(
        attribute: Attribute,
        to otherAttribute: Attribute,
        of view: View,
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        
        let constraint = makeConstraint(attribute: attribute,
                                        to: otherAttribute,
                                        of: view,
                                        constant: constant,
                                        priority: priority,
                                        relatedBy: relation)
        return constraint.activate()
    }
    
    @discardableResult func constrainWidth(to constant: CGFloat = 0,
                        priority: Priority = Priority.required,
                        relatedBy relation: Relation = .equal) -> Constraint {
        let constraint = makeConstraint(attribute: .width,
                              constant: constant,
                              priority: priority,
                              relatedBy: relation)
        return constraint.activate()
    }
    
    @discardableResult func constrainHeight(to constant: CGFloat = 0,
                        priority: Priority = Priority.required,
                        relatedBy relation: Relation = .equal) -> Constraint {
        let constraint = makeConstraint(attribute: .height,
                              constant: constant,
                              priority: priority,
                              relatedBy: relation)
        return constraint.activate()
    }
    
}
