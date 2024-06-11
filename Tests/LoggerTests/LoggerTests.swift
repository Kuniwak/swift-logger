import XCTest
import Logger


final class LoggerTests: XCTestCase {
    private struct TestCase: CustomStringConvertible {
        public let description: String
        public let line: UInt
        public let severity: LogSeverity
        public let input: (severity: LogSeverity, message: String)
        public let expected: [CapturedLogEntry]
        
        public init(line: UInt = #line, description: String, severity: LogSeverity, input: (severity: LogSeverity, message: String), expected: [CapturedLogEntry]) {
            self.description = description
            self.line = line
            self.severity = severity
            self.input = input
            self.expected = expected
        }
    }
    
    func testLog() {
        let testCases: [TestCase] = [
            .init(
                description: "debug vs debug",
                severity: .debug,
                input: (severity: .debug, message: "TEST"),
                expected: [CapturedLogEntry(severity: .debug, message: "TEST")]
            ),
            .init(
                description: "error vs debug",
                severity: .error,
                input: (severity: .debug, message: "TEST"),
                expected: []
            ),
            .init(
                description: "error vs error",
                severity: .error,
                input: (severity: .error, message: "TEST"),
                expected: [CapturedLogEntry(severity: .error, message: "TEST")]
            ),
        ]
        
        for testCase in testCases {
            let spy = SpyLogWriter()
            let logger = Logger(severity: testCase.severity, writer: spy)
            
            switch testCase.input.severity {
            case .debug:
                logger.debug(testCase.input.message)
            case .info:
                logger.info(testCase.input.message)
            case .notice:
                logger.notice(testCase.input.message)
            case .error:
                logger.error(testCase.input.message)
            case .fault:
                logger.fault(testCase.input.message)
            }
        }
    }
}
