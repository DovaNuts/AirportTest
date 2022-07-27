//
//  MainPresenterTests.swift
//  AirportTestTests
//
//  Created by Axel Gonzalez on 26/07/22.
//

import Foundation
import XCTest
@testable import AirportTest

class MainPresenterTests: XCTestCase {
    var sut: MainPresenter!
    var viewControllerSpy: MainViewControllerSpy!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MainPresenter()
        viewControllerSpy = MainViewControllerSpy()
    }
    
    // MARK: Tests
    override func tearDownWithError() throws {
        sut = nil
        viewControllerSpy = nil
        
        try super.tearDownWithError()
    }
}

class MainViewControllerSpy: MainDisplayLogic {
    func displayRadius(_ radius: String) {
        
    }
    
    func displayLocationError() {
        
    }
    
    func fetchAirportList() {
        
    }
}
