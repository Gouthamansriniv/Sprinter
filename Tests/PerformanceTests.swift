//
//  PerformanceTests.swift
//  Sprinter
//
//  Created by Nick Lockwood on 23/11/2017.
//  Copyright © 2017 Nick Lockwood. All rights reserved.
//

import XCTest
import Sprinter

let iterations = 1000

let simpleFormat = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque finibus malesuada eros, at tincidunt augue blandit sit amet."

let complexFormat = "Lorem %% ipsum %i dolor %3f sit %.4g amet, %d consectetur %x adipiscing %*6$i elit. %@ Quisque finibus %@ malesuada %llu eros, %hhi at %14$*15$.*16$g tincidunt %A augue %ld blandit %% sit %zi amet."

class PerformanceTests: XCTestCase {

    func testCreateSimpleFormatString() {
        self.measure {
            for _ in 0 ..< iterations {
                _ = try! FormatString(simpleFormat)
            }
        }
    }

    func testPrintSimpleFormatString() {
        let formatString = try! FormatString(simpleFormat)
        self.measure {
            for _ in 0 ..< iterations {
                _ = try! formatString.print()
            }
        }
    }

    func testSwiftPrintSimpleFormatString() {
        self.measure {
            for _ in 0 ..< iterations {
                _ = String(format: simpleFormat)
            }
        }
    }

    func testCreateComplexFormatString() {
        self.measure {
            for _ in 0 ..< iterations {
                _ = try! FormatString(complexFormat)
            }
        }
    }

    func testPrintComplexFormatString() {
        let formatString = try! FormatString(complexFormat)
        self.measure {
            for _ in 0 ..< iterations {
                _ = try! formatString.print(
                    5, 0.5, 3.2, 5000, 10, 5, "foo", "bar", UInt64(3), Int8(1), 5, 6, 7, 8, 9, 10
                )
            }
        }
    }

    func testSwiftPrintComplexFormatString() {
        self.measure {
            for _ in 0 ..< iterations {
                _ = String(format: complexFormat,
                    5, 0.5, 3.2, 5000, 10, 5, "foo", "bar", UInt64(3), Int8(1), 5, 6, 7, 8, 9, 10
                )
            }
        }
    }
}
