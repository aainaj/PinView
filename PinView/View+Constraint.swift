import Foundation

extension View {
    
    func makeConstraint(
        attribute: Attribute,
        to otherAttribute: Attribute,
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        
        guard let superview = self.superview else {
            preconditionFailure("View has no superview")
        }
        
        prepareForConstraints()
        
      return makeConstraint(attribute: attribute,
                            to: otherAttribute,
                            of: superview,
                            constant: constant,
                            priority: priority,
                            relatedBy: relation)
    }
    
    func makeConstraint(
        attribute: Attribute,
        to otherAttribute: Attribute,
        of view: View,
        constant: CGFloat = 0,
        priority: Priority = Priority.required,
        relatedBy relation: Relation = .equal) -> Constraint {
        
        if view !== self.superview {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let firstAnchor = attribute.layoutAnchor(for: self)
        let secondAnchor = otherAttribute.layoutAnchor(for: view)
        
        return layoutConstraint(firstAnchor: firstAnchor,
                                to: secondAnchor,
                                constant: constant,
                                priority: priority,
                                relatedBy: relation)
    }
    
    func layoutConstraint(firstAnchor: LayoutAnchor<AnyObject>,
                          to secondAnchor: LayoutAnchor<AnyObject>,
                          constant: CGFloat = 0,
                          priority: Priority = Priority.required,
                          relatedBy relation: Relation = .equal) -> Constraint {
        let constraint: Constraint
        
        switch relation {
        case .equal:
            constraint = firstAnchor.constraint(equalTo: secondAnchor, constant: constant)
        case .lessThanOrEqual:
            constraint = firstAnchor.constraint(lessThanOrEqualTo: secondAnchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = firstAnchor.constraint(greaterThanOrEqualTo: secondAnchor, constant: constant)
        }
        
        constraint.priority = priority
        return constraint
    }
    
}
