//
//  POCAppTests.swift
//  POCAppTests
//
//  Created by Kavita Patil on 04/05/20.
//  Copyright © 2020 Kavita Patil. All rights reserved.
//

import XCTest
@testable import POCApp

class POCAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testFactsViewModel() {
        let facts = Rows(title: "Housing", description: "Warmer than you might you think", imageHref: "")
        let factsViewModel = FactsViewModel(rows: facts)
        XCTAssertEqual(facts.title,factsViewModel.factTitle)
        XCTAssertEqual(facts.description, factsViewModel.factDescription)
    }

}
