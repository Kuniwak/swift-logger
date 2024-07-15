public final actor SpyLogger: LoggerProtocol {
    nonisolated public let entries = CapturedEntries()
    
    
    public init() {}
    
    
    nonisolated public func trace(_ s: String = #function) {
        debug(s)
    }
    
    nonisolated public func debug(_ message: String) {
        entries.append(.init(severity: .debug, message: message))
    }
    
    nonisolated public func info(_ message: String) {
        entries.append(.init(severity: .info, message: message))
    }
    
    nonisolated public func notice(_ message: String) {
        entries.append(.init(severity: .notice, message: message))
    }
    
    nonisolated public func error(_ message: String) {
        entries.append(.init(severity: .error, message: message))
    }
    
    nonisolated public func fault(_ message: String) {
        entries.append(.init(severity: .fault, message: message))
    }
}


public final class CapturedEntries {
    private var entries = [CapturedLogEntry]()
    
    
    public init() {}
    
    
    public subscript(index: Int) -> CapturedLogEntry {
        return entries[index]
    }
    
    
    fileprivate func append(_ entry: CapturedLogEntry) {
        entries.append(entry)
    }
}


public struct CapturedLogEntry: Equatable, Codable, Sendable {
    public let severity: LogSeverity
    public let message: String
    
    public init(severity: LogSeverity, message: String) {
        self.severity = severity
        self.message = message
    }
}
