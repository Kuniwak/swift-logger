import Dispatch


public final class SpyLogWriter: LogWriterProtocol, @unchecked Sendable {
    private let queue = DispatchQueue(label: "SpyLogWriter")
    public private(set) var capturedLogs: [CapturedLogEntry] = []
    
    public init() {}
    
    public func log(_ severity: LogSeverity, _ message: String) {
        queue.sync {
            capturedLogs.append(CapturedLogEntry(severity: severity, message: message))
        }
    }
}
