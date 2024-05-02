import XCTest
import DvorakCodec

final class DvorakEncoderDecoderTests: XCTestCase {
    func testExample() throws {

        let qwerty = "\"'+,-./:;<=>?ABCDEFGHIJKLMNOPQRSTUVWXYZ[]_abcdefghijklmnopqrstuvwxyz{}"
        let dvorak = "_-}w[vzSsW]VZAXJE>UIDCHTNMBRL\"POYGK<QF:/={axje.uidchtnmbrl'poygk,qf;?+"
        XCTAssertEqual(qwerty.dvorakEncoded(), dvorak)
        XCTAssertEqual(dvorak.dvorakDecoded(), qwerty)
        XCTAssertEqual("aoeu".dvorakDecoded(), "asdf")
        XCTAssertEqual("Hello, world!".dvorakEncoded(), "D.nnrw ,rpne!")
        XCTAssertEqual("D.nnrw ,rpne!".dvorakDecoded(), "Hello, world!")
    }

    func testExampleColemak() throws {

        let qwerty = "\"'+,-./:;<=>?ABCDEFGHIJKLMNOPQRSTUVWXYZ[]_abcdefghijklmnopqrstuvwxyz{}"
        let colemak = "\"'+,-./Oo<=>?ABCSFTDHUNEIMKY:QPRGLVWXJZ[]_abcsftdhuneimky;qprglvwxjz{}"
        XCTAssertEqual(qwerty.colemakEncoded(), colemak)
        XCTAssertEqual("asdf".colemakEncoded(), "arst")
        XCTAssertEqual(colemak.colemakDecoded(), qwerty)
        XCTAssertEqual("arst".colemakDecoded(), "asdf")
    }
}
