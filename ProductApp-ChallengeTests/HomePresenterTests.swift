//
//  HomePresenterTests.swift
//  ProductApp-ChallengeTests
//
//  Created by Ivan Valero on 30/08/2022.
//

import XCTest
@testable import ProductApp_Challenge

@MainActor class HomePresenterTests: XCTestCase{
    
    var sut: HomePresenter!
    var sutDelegate: HomeViewMock!
    var providerMock: HomeProviderMock!
    var timeOut: TimeInterval = 2.0
    var drinkName = "ABC"
    
    @MainActor override func setUpWithError() throws {
        sutDelegate = HomeViewMock()
        providerMock = HomeProviderMock()
        sut = HomePresenter(delegate: sutDelegate, provider:  providerMock)
    }

    @MainActor override func tearDownWithError() throws {
        sutDelegate = nil
        providerMock = nil
        sut = nil
    }

    func test_GetDrinkList() {
        sutDelegate.expGetData = expectation(description: "loading drinks")
        
        Task {
            await sut.getDrinkList()
        }
        waitForExpectations(timeout: timeOut)
        
        guard let drinks = sut.drinkList.first as? [Drinks.ResultDrinks] else {
            XCTFail("falló por que no existe el objeto")
            return
        }
        
        XCTAssertTrue(drinks.first?.strDrink == drinkName, "El nombre es \(String(describing: drinks.first?.strDrink))")
        
        XCTAssertTrue(sut.drinkList.count > 0, "La cantidad de objetos es: \(sut.drinkList.count)")
        
        
        
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}


class HomeViewMock: HomeViewProtocol {
    var getDataWasCalled: Bool = false
    var showErrorWasCalled: Bool = false
    var expGetData: XCTestExpectation?
    
    func getData(list: [[Drinks.ResultDrinks]]) {
        getDataWasCalled = true
        expGetData?.fulfill()
    }
    
    func showError(_ error: String, callback: (() -> Void)?) {
        showErrorWasCalled = true
    }
    
    
}
