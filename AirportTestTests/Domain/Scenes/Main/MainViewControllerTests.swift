//
//  MainViewControllerTests.swift
//  AirportTestTests
//
//  Created by Axel Gonzalez on 26/07/22.
//

import Foundation
import MapKit
import XCTest
@testable import AirportTest

class MainViewControllerTests: XCTestCase {
    var sut: MainViewController!
    var interactorSpy: MainInteractorSpy!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = MainViewController()
        interactorSpy = MainInteractorSpy()
        
        let storyboard = UIStoryboard(name: "AirportFinder", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
        sut.loadViewIfNeeded()
    }
    
    // MARK: Tests
    func testIfSearchButtonHasActionAssigned() {
        // Given
        let searchButton: UIButton = sut.searchButton
        
        // When
        guard let searchButtonAction = searchButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            return XCTFail("Search button does not have action assigned for event .touchUpInside")
        }
        
        // Then
        XCTAssertTrue(searchButtonAction.contains("searchButtonTapped:"),
        "searchButton should trigger searchButtonTapped: action")
    }
    
    override func tearDownWithError() throws {
        sut = nil
        interactorSpy = nil
        
        try super.tearDownWithError()
    }
}

// MARK: Interactor Spy
class MainInteractorSpy: MainBusinessLogic, MainDataStore {
    var airports: [Airport] = []
    var location = CLLocationCoordinate2D()
    var radius: Float = 0

    var updateCurrentLocationCalled = false
    var getRadiusCalled = false
    var fetchAirportListCalled = false
    var tryToFetchAirportListCalled = false
    
    func updateCurrentLocation(_ newLocation: CLLocationCoordinate2D) {
        updateCurrentLocationCalled = true
    }
    
    func getRadius(_ selectedRadius: Float) {
        getRadiusCalled = true
    }
    
    func fetchAirportList() async {
        fetchAirportListCalled = true
    }
    
    func tryToFetchAirportList() {
        tryToFetchAirportListCalled = true
    }
}
