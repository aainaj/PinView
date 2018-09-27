//
//  PinToSuperviewAttributesTests.swift
//  PinViewTests
//
//  Created by Jain, Aaina on 7/28/18.
//  Copyright © 2018 aaina. All rights reserved.
//

import XCTest
@testable import PinView

final class View_PinToSuperviewAttributesTests: XCTestCase {
    
    var superview: View!
    var view: View!
    
    let insetConstant: CGFloat = 20
    let superviewFrame = CGRect(x: 0, y: 0, width: 200, height: 300)
    let insetsFrame = CGRect(x: 20, y: 20, width: 160, height: 260)
    let viewTopInsetFrame = CGRect(x: 0, y: 20, width: 200, height: 280)
    let viewLeadingInsetFrame = CGRect(x: 20, y: 0, width: 160, height: 300)
    
    override func setUp() {
        super.setUp()
        setupViewHierarchy()
    }
    
    private func setupViewHierarchy() {
        superview = UIView(frame: superviewFrame)
        view = UIView()
        superview.addSubview(view)
    }
    
    private func updateFrames() {
        superview.layoutIfNeeded()
    }
    
    // MARK: pinToSuperviewAttributes() tests
    func test_constraints_WhenPinToSuperview_ShouldHavePriorityRequired() {
        view.pinToSuperviewAttributes()
        
        superview.constraints.forEach { constraint in
            XCTAssertEqual(constraint.priority, Priority.required)
        }
    }
    
    func test_constraints_WhenPinToSuperview_ShouldHaveFrameSimilarToSuperview() {
        view.pinToSuperviewAttributes()
        updateFrames()
        
        XCTAssertEqual(view.frame, superviewFrame)
    }
    
    func test_constraints_WhenPinToSuperviewWithInsets_ShouldHaveMarginToSuperview() {
        view.pinToSuperviewAttributes(constant: insetConstant)
        
        updateFrames()
        
        XCTAssertEqual(view.frame, insetsFrame)
    }
    
    // MARK: pinToSuperview(attributes:) tests
    func test_constraints_WhenPinToSuperviewWithAllEdges_ShouldHaveFrameSimilarToSuperview() {
        view.pinToSuperview(attributes: [.top, .leading, .trailing, .bottom])
        updateFrames()
        
        XCTAssertEqual(view.frame, superviewFrame)
    }
    
    func test_constraints_WhenPinToSuperviewSeparately_ShouldHaveFrameSimilarToSuperview() {
        view.pinToSuperviewTop(constant: insetConstant)
        view.pinToSuperviewBottom()
        view.pinToSuperviewLeading()
        view.pinToSuperviewTrailing()
        
        updateFrames()
        
        XCTAssertEqual(view.frame, viewTopInsetFrame)
    }
    
    // MARK: Combines APIs tests
    func test_constraints_WhenPinToSuperviewWithDifferentAPI_ShouldHaveFrameSimilarToSuperview() {
        view.pinToSuperviewTop(constant: insetConstant)
        view.pinToSuperview(attributes: [.leading, .trailing, .bottom])
        updateFrames()
        
        XCTAssertEqual(view.frame, viewTopInsetFrame)
    }
    
    func test_frame_WhenPinToSuperviewAndConstantUpdatedSeparately_ShouldHaveSameFrameToSuperview() {
        let top = view.pinToSuperviewTop()
        view.pinToSuperview(attributes: [.leading, .trailing, .bottom])
        
        top.constant = insetConstant
        updateFrames()
        
        XCTAssertEqual(view.frame, viewTopInsetFrame)
    }
    
    func test_constraints_WhenPinToSuperviewCenter_ShouldHaveFrameSimilarToSuperview() {
        view.pinToSuperviewCenter()
        updateFrames()
        
        XCTAssertEqual(view.center, superview.center)
    }
    
}
