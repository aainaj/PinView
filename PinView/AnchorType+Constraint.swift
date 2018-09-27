//
//  AnchorType+Constraint.swift
//  PinView
//
//  Created by Jain, Aaina on 7/26/18.
//  Copyright © 2018 aaina. All rights reserved.
//
import Foundation

extension AnchorType {
    
    func makeConstraint(
        attribute: Attribute,
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {

        switch attribute {
        case .width:
            return constraint(dimension: widthAnchor, constant: constant)
        case .height:
            return constraint(dimension: heightAnchor, constant: constant)
        default:
            guard let superview = owningView else {
                fatalError("View has no superview")
            }
            
            return makeConstraint(attribute: attribute,
                                  to: attribute,
                                  of: superview,
                                  constant: constant,
                                  priority: priority,
                                  relatedBy: relation)
        }
    }
    
    func makeConstraint(
        attribute: Attribute,
        to otherAttribute: Attribute,
        of view: View,
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        
        let anchor = attribute.layoutAnchor(for: self)
        let otherAnchor = otherAttribute.layoutAnchor(for: view)
        
       return makeConstraint(anchor: anchor, to: otherAnchor, of: view, constant: constant, priority: priority, relatedBy: relation)
    }
    
    func makeConstraint(
        anchor: LayoutAnchor<AnyObject>,
        to otherAnchor: LayoutAnchor<AnyObject>,
        of view: View,
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        
        prepareForConstraints()
        
        if view !== owningView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        if let dimension = anchor as? LayoutAnchor<Dimension> as? Dimension,
            let otherDimension = otherAnchor as? LayoutAnchor<Dimension> as? Dimension {
           return constraint(dimension: dimension,
                       to: otherDimension,
                       multiplier: 1.0,
                       constant: constant,
                       priority: priority,
                       relatedBy: relation)
        } else {
            return constraint(anchor: anchor,
                              to: otherAnchor,
                              constant: constant,
                              priority: priority,
                              relatedBy: relation)
        }
    }
    
    func constraint(anchor: LayoutAnchor<AnyObject>,
                          to otherAnchor: LayoutAnchor<AnyObject>,
                          constant: CGFloat = 0,
                          priority: Priority = Priority.required,
                          relatedBy relation: Relation = .equal) -> Constraint {
        let constraint: Constraint
        
        switch relation {
        case .equal:
            constraint = anchor.constraint(equalTo: otherAnchor, constant: constant)
        case .lessThanOrEqual:
            constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: constant)
        }
        
        constraint.priority = priority
        return constraint
    }
    
    func constraint(dimension: Dimension,
                          to otherDimension: Dimension,
                          multiplier: CGFloat = 0,
                          constant: CGFloat = 0,
                          priority: Priority = Priority.required,
                          relatedBy relation: Relation = .equal) -> Constraint {
        let constraint: Constraint
        
        prepareForConstraints()
        
        switch relation {
        case .equal:
            constraint = dimension.constraint(equalTo: otherDimension, multiplier: multiplier, constant: constant)
        case .lessThanOrEqual:
            constraint = dimension.constraint(lessThanOrEqualTo: otherDimension, multiplier: multiplier, constant: constant)
        case .greaterThanOrEqual:
            constraint = dimension.constraint(greaterThanOrEqualTo: otherDimension, multiplier: multiplier, constant: constant)
        }
        
        constraint.priority = priority
        return constraint
    }
    
    func constraint(dimension: Dimension,
                    constant: CGFloat = 0,
                    priority: Priority = Priority.required,
                    relatedBy relation: Relation = .equal) -> Constraint {
        let constraint: Constraint
        
        prepareForConstraints()
        
        switch relation {
        case .equal:
            constraint = dimension.constraint(equalToConstant: constant)
        case .lessThanOrEqual:
            constraint = dimension.constraint(lessThanOrEqualToConstant: constant)
        case .greaterThanOrEqual:
            constraint = dimension.constraint(greaterThanOrEqualToConstant: constant)
        }
        
        constraint.priority = priority
        return constraint
    }
    
}
