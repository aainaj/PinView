//
//  PinToViewAttributeTests.swift
//  PinViewTests
//
//  Created by Jain, Aaina on 7/31/18.
//  Copyright © 2018 aaina. All rights reserved.
//
import XCTest
@testable import PinView

final class View_PinToViewAttributeTest: XCTestCase {
    
    var container: View!
    var redView: View!
    var greenView: View!
    var blueView: View!
    
    let containerFrame = CGRect(x: 0, y: 0, width: 200, height: 300)
    
    override func setUp() {
        super.setUp()
        setupViewHierarchy()
    }
    
    private func setupViewHierarchy() {
        container = UIView(frame: containerFrame)
        redView = UIView()
        greenView = UIView()
        blueView = UIView()

        container.addSubview(redView)
        container.addSubview(greenView)
        container.addSubview(blueView)
    }
    
    private func updateFrames() {
        container.setNeedsLayout()
        container.layoutIfNeeded()
    }
    
    // MARK: pinToViewAttributes() tests
    func test_WhenWidthSpecified_ShouldCalculateWidthOfOtherView() {
        redView.pinToSuperview(attributes: [.top, .leading], constant: 10)
        greenView.pinToSuperview(attributes: [.top, .trailing], constant: 10)
        greenView.pin(attribute: .leading, to: .trailing, of: redView, constant: 10)
        blueView.pinToSuperview(attributes: [.leading, .trailing, .bottom], constant: 10)
        blueView.pin(attribute: .top, to: .bottom, of: redView, constant: 10)
        redView.constrainWidth(to: 90)
        
        updateFrames()
        
        XCTAssertEqual(greenView.frame.size.width, 80)
    }
    
    func test_ViewIsAlignedWithOtherView() {
        redView.pinToSuperview(attributes: [.top, .leading, .bottom], constant: 10)
        greenView.pinToSuperview(attributes: [.top, .trailing, .bottom], constant: 10)
        greenView.pin(attribute: .leading, to: .trailing, of: redView)
        redView.constrainWidth(to: 90)
        
        updateFrames()
        
        XCTAssertEqual(greenView.frame.origin.x, 100)
    }
    
    func test_ViewIsAlignedWithOtherViewVertically() {
        redView.pinToSuperview(attributes: [.leading, .trailing, .top],
                               constant: 10)
        greenView.pinLeading(to: redView)
        greenView.pinTrailing(to: redView)
        greenView.pinToSuperviewBottom()
        
        updateFrames()
        
        XCTAssertEqual(greenView.frame.origin.x, 10)
    }
    
    func test_ViewIsAlignedWithOtherViewVertically_WhenAttributesAreInArray() {
        redView.pinToSuperview(attributes: [.leading, .trailing, .top],
                               constant: 10)
        greenView.pin(attributes: [.leading, .trailing], to: redView)
        greenView.pinToSuperviewBottom()
        
        updateFrames()
        
        XCTAssertEqual(greenView.frame.origin.x, 10)
    }
    
}
