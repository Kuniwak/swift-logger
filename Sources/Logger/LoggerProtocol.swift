public protocol LoggerProtocol: AnyActor {
    nonisolated func debug(_ message: String)
    nonisolated func info(_ message: String)
    nonisolated func notice(_ message: String)
    nonisolated func error(_ message: String)
    nonisolated func fault(_ message: String)
}


extension LoggerProtocol {
    public func trace(_ s: String = #function) {
        debug(s)
    }
}


public final actor Logger: LoggerProtocol {
    nonisolated private let severity: LogSeverity
    nonisolated private let writer: any LogWriterProtocol
    
    public init(severity: LogSeverity, writer: any LogWriterProtocol) {
        self.severity = severity
        self.writer = writer
    }
    
    nonisolated public func debug(_ message: String) {
        guard severity <= .debug else { return }
        writer.log(.debug, message)
    }
    
    nonisolated public func info(_ message: String) {
        guard severity <= .info else { return }
        writer.log(.info, message)
    }
    
    nonisolated public func notice(_ message: String) {
        guard severity <= .notice else { return }
        writer.log(.notice, message)
    }
    
    nonisolated public func error(_ message: String) {
        guard severity <= .error else { return }
        writer.log(.error, message)
    }
    
    nonisolated public func fault(_ message: String) {
        guard severity <= .fault else { return }
        writer.log(.fault, message)
    }
}
