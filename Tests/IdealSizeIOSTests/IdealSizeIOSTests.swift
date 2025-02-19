//
//  IdealSizeIOSTests.swift
//  IdealSizeIOSTests
//
//  Created by Mikhail on 19.02.2025.
//

import XCTest
@testable import IdealSizeIOS

struct SizeWithBMI: Sendable {
    var bmi: Float
    var size: SizeEnum
}

final class IdealSizeIOSTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNegativeBMI() throws {
        XCTAssertThrowsError(try IdealSize.sizeByBMI(with: -1)) { error in
            XCTAssertEqual(error as? IdealSizeError, IdealSizeError.invalidBMI)
        }
    }
    
    func testZeroBMI() throws {
        XCTAssertThrowsError(try IdealSize.sizeByBMI(with: 0)) { error in
            XCTAssertEqual(error as? IdealSizeError, IdealSizeError.invalidBMI)
        }
    }
    
    func testBigBMI() throws {
        XCTAssertThrowsError(try IdealSize.sizeByBMI(with: 70)) { error in
            XCTAssertEqual(error as? IdealSizeError, IdealSizeError.invalidBMI)
        }
    }

    func testSizeByBMI() throws {
        let testData = [
            SizeWithBMI(bmi: 10, size: SizeEnum.S),
            SizeWithBMI(bmi: 18.4, size: SizeEnum.S),
            SizeWithBMI(bmi: 18.5, size: SizeEnum.M),
            SizeWithBMI(bmi: 24.9, size: SizeEnum.M),
            SizeWithBMI(bmi: 25, size: SizeEnum.L),
            SizeWithBMI(bmi: 29.9, size: SizeEnum.L),
            SizeWithBMI(bmi: 30, size: SizeEnum.XL),
            SizeWithBMI(bmi: 50, size: SizeEnum.XL),
            ]
        
        for data in testData {
            let result = try IdealSize.sizeByBMI(with: data.bmi)
            XCTAssertEqual(result, data.size)
        }
    }
}
