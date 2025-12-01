import Foundation

/// A parser for documentation content with custom extensions.
public struct DocumentationParser: Sendable {
    
    public init() {}
    
    /// Parsed documentation result.
    public struct ParseResult: Sendable {
        public let frontMatter: [String: String]
        public let content: String
        public let blocks: [ContentBlock]
        public let links: [ParsedLink]
        public let codeBlocks: [ParsedCodeBlock]
        public let callouts: [ParsedCallout]
        public let errors: [ParseError]
    }
    
    /// A block of parsed content.
    public enum ContentBlock: Sendable {
        case paragraph(String)
        case heading(level: Int, text: String, id: String?)
        case codeBlock(ParsedCodeBlock)
        case callout(ParsedCallout)
        case list(items: [String], ordered: Bool)
        case blockquote(String)
        case table(ParsedTable)
        case image(ParsedImage)
        case divider
        case custom(extension: MarkdownExtension, content: String)
    }
    
    public struct ParsedCodeBlock: Sendable {
        public let language: String
        public let filename: String?
        public let code: String
        public let highlightedLines: [Int]
        public let showLineNumbers: Bool
    }
    
    public struct ParsedCallout: Sendable {
        public let type: CalloutType
        public let title: String?
        public let content: String
    }
    
    public struct ParsedLink: Sendable {
        public let text: String
        public let url: String
        public let isExternal: Bool
        public let isAPIReference: Bool
    }
    
    public struct ParsedTable: Sendable {
        public let headers: [String]
        public let rows: [[String]]
        public let alignment: [TableAlignment]
    }
    
    public enum TableAlignment: Sendable {
        case left, center, right
    }
    
    public struct ParsedImage: Sendable {
        public let alt: String
        public let url: String
        public let caption: String?
        public let width: Int?
        public let height: Int?
    }
    
    public struct ParseError: Sendable {
        public let line: Int
        public let column: Int
        public let message: String
        public let severity: ErrorSeverity
    }
    
    public enum ErrorSeverity: Sendable {
        case warning, error
    }
    
    /// Parse markdown content with extensions.
    public func parse(_ content: String) -> ParseResult {
        var frontMatter: [String: String] = [:]
        var blocks: [ContentBlock] = []
        var links: [ParsedLink] = []
        var codeBlocks: [ParsedCodeBlock] = []
        var callouts: [ParsedCallout] = []
        var errors: [ParseError] = []
        
        let lines = content.components(separatedBy: .newlines)
        var processedContent = content
        var index = 0
        
        // Parse front matter
        if lines.first == "---" {
            var frontMatterLines: [String] = []
            index = 1
            while index < lines.count && lines[index] != "---" {
                frontMatterLines.append(lines[index])
                index += 1
            }
            index += 1
            
            for line in frontMatterLines {
                let parts = line.split(separator: ":", maxSplits: 1)
                if parts.count == 2 {
                    frontMatter[String(parts[0]).trimmingCharacters(in: .whitespaces)] =
                        String(parts[1]).trimmingCharacters(in: .whitespaces)
                }
            }
            
            processedContent = lines[index...].joined(separator: "\n")
        }
        
        // Parse code blocks
        let codeBlockPattern = "```(\\w+)?(?::([^\\n]+))?\\n([\\s\\S]*?)```"
        if let regex = try? NSRegularExpression(pattern: codeBlockPattern, options: [.dotMatchesLineSeparators]) {
            let matches = regex.matches(in: processedContent, range: NSRange(processedContent.startIndex..., in: processedContent))
            for match in matches {
                let languageRange = Range(match.range(at: 1), in: processedContent)
                let filenameRange = Range(match.range(at: 2), in: processedContent)
                let codeRange = Range(match.range(at: 3), in: processedContent)

                let block = ParsedCodeBlock(
                    language: languageRange.map { String(processedContent[$0]) } ?? "",
                    filename: filenameRange.map { String(processedContent[$0]) },
                    code: codeRange.map { String(processedContent[$0]) } ?? "",
                    highlightedLines: [],
                    showLineNumbers: true
                )
                codeBlocks.append(block)
                blocks.append(.codeBlock(block))
            }
        }

        // Parse callouts
        let calloutPattern = ":::(note|tip|warning|important|caution|info|success|danger|experiment)\\n([\\s\\S]*?):::"
        if let regex = try? NSRegularExpression(pattern: calloutPattern, options: [.dotMatchesLineSeparators]) {
            let matches = regex.matches(in: processedContent, range: NSRange(processedContent.startIndex..., in: processedContent))
            for match in matches {
                guard
                    let typeRange = Range(match.range(at: 1), in: processedContent),
                    let contentRange = Range(match.range(at: 2), in: processedContent),
                    let type = CalloutType(rawValue: String(processedContent[typeRange]))
                else { continue }

                let callout = ParsedCallout(
                    type: type,
                    title: nil,
                    content: String(processedContent[contentRange]).trimmingCharacters(in: .whitespacesAndNewlines)
                )
                callouts.append(callout)
                blocks.append(.callout(callout))
            }
        }

        // Parse links
        let linkPattern = "\\[([^\\]]+)\\]\\(([^)]+)\\)"
        if let regex = try? NSRegularExpression(pattern: linkPattern) {
            let matches = regex.matches(in: processedContent, range: NSRange(processedContent.startIndex..., in: processedContent))
            for match in matches {
                guard
                    let textRange = Range(match.range(at: 1), in: processedContent),
                    let urlRange = Range(match.range(at: 2), in: processedContent)
                else { continue }

                let url = String(processedContent[urlRange])
                links.append(ParsedLink(
                    text: String(processedContent[textRange]),
                    url: url,
                    isExternal: url.hasPrefix("http"),
                    isAPIReference: url.hasPrefix("doc:")
                ))
            }
        }

        // Parse headings
        let headingPattern = "^(#{1,6})\\s+(.+)$"
        if let regex = try? NSRegularExpression(pattern: headingPattern, options: [.anchorsMatchLines]) {
            let matches = regex.matches(in: processedContent, range: NSRange(processedContent.startIndex..., in: processedContent))
            for match in matches {
                guard
                    let levelRange = Range(match.range(at: 1), in: processedContent),
                    let textRange = Range(match.range(at: 2), in: processedContent)
                else { continue }

                let level = processedContent[levelRange].count
                let text = String(processedContent[textRange])
                let id = text.lowercased().replacingOccurrences(of: " ", with: "-")
                blocks.append(.heading(level: level, text: text, id: id))
            }
        }
        
        return ParseResult(
            frontMatter: frontMatter,
            content: processedContent,
            blocks: blocks,
            links: links,
            codeBlocks: codeBlocks,
            callouts: callouts,
            errors: errors
        )
    }
    
    /// Validate documentation content.
    public func validate(_ content: String) -> [ParseError] {
        var errors: [ParseError] = []
        let lines = content.components(separatedBy: .newlines)
        
        for (index, line) in lines.enumerated() {
            // Check for broken links
            if line.contains("]()") {
                errors.append(ParseError(
                    line: index + 1,
                    column: 0,
                    message: "Empty link URL",
                    severity: .error
                ))
            }
            
            // Check for unclosed code blocks
            let backtickCount = line.filter { $0 == "`" }.count
            if backtickCount == 3 && !line.hasPrefix("```") {
                errors.append(ParseError(
                    line: index + 1,
                    column: 0,
                    message: "Malformed code block",
                    severity: .warning
                ))
            }
        }
        
        return errors
    }
}
