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
    var timeOut: TimeInterval = 5.0
    var drinkName = "B-53"
    
    @MainActor override func setUpWithError() throws {
        MockManager.shared.runAppWithMock = true
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
        
        guard let drinks = sut.drinkList.first else {
            XCTFail("falló por que no existe el objeto")
            return
        }
        
        XCTAssertFalse(drinks.first?.strDrink != drinkName, "El nombre es \(String(describing: drinks.first?.strDrink))")
        
        XCTAssertTrue(drinks.last?.strInstructionsES == nil, "La instrucción existe: \(String(describing: drinks.last?.strInstructionsES))")
        
        
        XCTAssertTrue(sut.drinkList.count > 0, "La cantidad de objetos es: \(sut.drinkList.count)")

    }

    func test_GetDrinkList_Fail() {
        MockManager.shared.runAppWithMock = false
        sutDelegate = HomeViewMock()
        providerMock = HomeProviderMock()
        providerMock.throwError = true
        sutDelegate.expShowError = expectation(description: "loading")
        
        sut = HomePresenter(delegate: sutDelegate, provider:  providerMock)
        
        Task {
            await sut.getDrinkList()
        }
        waitForExpectations(timeout: timeOut)
        
        XCTAssertTrue(sutDelegate.showErrorWasCalled)
        
    }
    

}


class HomeViewMock: HomeViewProtocol {
    var getDataWasCalled: Bool = false
    var showErrorWasCalled: Bool = false
    var expGetData: XCTestExpectation?
    var expShowError: XCTestExpectation?
    
    func getData(list: [[Drinks.ResultDrinks]]) {
        getDataWasCalled = true
        expGetData?.fulfill()
    }
    
    func showError(_ error: String, callback: (() -> Void)?) {
        showErrorWasCalled = true
        expShowError?.fulfill()
    }
    
    
}
