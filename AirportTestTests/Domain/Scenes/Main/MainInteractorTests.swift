//
//  MainInteractorTests.swift
//  AirportTestTests
//
//  Created by Axel Gonzalez on 26/07/22.
//

import Foundation
import XCTest
@testable import AirportTest

class MainInteractorTests: XCTestCase {
    var sut: MainInteractor!
    var presenterSpy: MainPresenterSpy!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = MainInteractor()
        presenterSpy = MainPresenterSpy()
    }
    
    // MARK: Tests
    override func tearDownWithError() throws {
        sut = nil
        presenterSpy = nil
    }
}


// MARK: Presenter Spy
class MainPresenterSpy: MainPresentationLogic {
    func presentRadius(_ radius: Int) {
        
    }
    
    func presentLocationError() {
        
    }
    
    func presentAirportList() {
        
    }
}
