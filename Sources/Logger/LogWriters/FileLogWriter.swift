import Foundation


public final class FileLogWriter: LogWriterProtocol, Sendable {
    private let fileHandle: FileHandle
    private let encoding: String.Encoding
    
    
    public init(writeTo fileHandle: FileHandle, encoding: String.Encoding) {
        self.fileHandle = fileHandle
        self.encoding = encoding
    }
    
    
    public func log(_ severity: LogSeverity, _ message: String) {
        guard let data = "\(severity.description): \(message)\n".data(using: encoding) else {
            return
        }
        
        if #available(iOS 13.4, tvOS 13.4, watchOS 6.2, *) {
            try? fileHandle.write(contentsOf: data)
            try? fileHandle.synchronize()
        } else {
            fileHandle.write(data)
            fileHandle.synchronizeFile()
        }
    }
}
