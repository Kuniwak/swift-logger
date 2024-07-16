public protocol LogWriterProtocol: Sendable {
    func log(_ severity: LogSeverity, _ message: String)
}
