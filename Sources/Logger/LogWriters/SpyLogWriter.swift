public final class SpyLogWriter: LogWriterProtocol {
    public private(set) var capturedLogs: [CapturedLogEntry] = []
    
    public init() {}
    
    public func log(_ severity: LogSeverity, _ message: String) {
        capturedLogs.append(CapturedLogEntry(severity: severity, message: message))
    }
}
