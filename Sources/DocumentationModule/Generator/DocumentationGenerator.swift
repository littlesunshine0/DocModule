import Foundation

/// Generator for producing documentation output in various formats.
public struct DocumentationGenerator: Sendable {
    
    public enum OutputFormat: String, Sendable, CaseIterable {
        case html
        case markdown
        case docC
        case pdf
        case epub
        case json
        case openAPI
        case manPage
        
        public var fileExtension: String {
            switch self {
            case .html: return "html"
            case .markdown: return "md"
            case .docC: return "docc"
            case .pdf: return "pdf"
            case .epub: return "epub"
            case .json: return "json"
            case .openAPI: return "yaml"
            case .manPage: return "1"
            }
        }
    }
    
    public struct GeneratorConfig: Sendable {
        public var outputFormat: OutputFormat
        public var outputPath: String
        public var theme: DocumentationTheme
        public var includeSearch: Bool
        public var includeNavigation: Bool
        public var syntaxHighlighting: Bool
        public var minifyOutput: Bool
        public var generateSitemap: Bool
        public var baseURL: String?
        
        public init(
            outputFormat: OutputFormat = .html,
            outputPath: String = "./docs",
            theme: DocumentationTheme = .default,
            includeSearch: Bool = true,
            includeNavigation: Bool = true,
            syntaxHighlighting: Bool = true,
            minifyOutput: Bool = false,
            generateSitemap: Bool = true,
            baseURL: String? = nil
        ) {
            self.outputFormat = outputFormat
            self.outputPath = outputPath
            self.theme = theme
            self.includeSearch = includeSearch
            self.includeNavigation = includeNavigation
            self.syntaxHighlighting = syntaxHighlighting
            self.minifyOutput = minifyOutput
            self.generateSitemap = generateSitemap
            self.baseURL = baseURL
        }
    }
    
    public struct GenerationResult: Sendable {
        public let success: Bool
        public let outputFiles: [GeneratedFile]
        public let errors: [GenerationError]
        public let warnings: [String]
        public let duration: TimeInterval
        public let statistics: GenerationStatistics
    }
    
    public struct GeneratedFile: Sendable {
        public let path: String
        public let size: Int
        public let checksum: String
    }
    
    public struct GenerationError: Sendable {
        public let file: String?
        public let message: String
        public let line: Int?
    }
    
    public struct GenerationStatistics: Sendable {
        public let totalFiles: Int
        public let totalSize: Int
        public let pageCount: Int
        public let imageCount: Int
        public let codeBlockCount: Int
        public let linkCount: Int
    }
    
    private let config: GeneratorConfig
    private let parser: DocumentationParser
    
    public init(config: GeneratorConfig = GeneratorConfig()) {
        self.config = config
        self.parser = DocumentationParser()
    }
    
    /// Generate documentation from content.
    public func generate(from content: [DocumentationContent]) async -> GenerationResult {
        let startTime = Date()
        var outputFiles: [GeneratedFile] = []
        var errors: [GenerationError] = []
        var warnings: [String] = []
        
        var totalCodeBlocks = 0
        var totalLinks = 0
        var totalImages = 0
        
        for item in content {
            let parseResult = parser.parse(item.content)
            totalCodeBlocks += parseResult.codeBlocks.count
            totalLinks += parseResult.links.count
            
            do {
                let output = try generateOutput(for: item, parseResult: parseResult)
                let file = GeneratedFile(
                    path: "\(config.outputPath)/\(item.slug).\(config.outputFormat.fileExtension)",
                    size: output.utf8.count,
                    checksum: output.hashValue.description
                )
                outputFiles.append(file)
            } catch {
                errors.append(GenerationError(
                    file: item.slug,
                    message: error.localizedDescription,
                    line: nil
                ))
            }
            
            for parseError in parseResult.errors {
                if parseError.severity == .warning {
                    warnings.append("\(item.slug):\(parseError.line): \(parseError.message)")
                } else {
                    errors.append(GenerationError(
                        file: item.slug,
                        message: parseError.message,
                        line: parseError.line
                    ))
                }
            }
        }
        
        let duration = Date().timeIntervalSince(startTime)
        
        return GenerationResult(
            success: errors.isEmpty,
            outputFiles: outputFiles,
            errors: errors,
            warnings: warnings,
            duration: duration,
            statistics: GenerationStatistics(
                totalFiles: outputFiles.count,
                totalSize: outputFiles.reduce(0) { $0 + $1.size },
                pageCount: content.count,
                imageCount: totalImages,
                codeBlockCount: totalCodeBlocks,
                linkCount: totalLinks
            )
        )
    }
    
    private func generateOutput(for content: DocumentationContent, parseResult: DocumentationParser.ParseResult) throws -> String {
        switch config.outputFormat {
        case .html:
            return generateHTML(content: content, parseResult: parseResult)
        case .markdown:
            return content.content
        case .docC:
            return generateDocC(content: content, parseResult: parseResult)
        case .json:
            return generateJSON(content: content)
        default:
            return content.content
        }
    }
    
    private func generateHTML(content: DocumentationContent, parseResult: DocumentationParser.ParseResult) -> String {
        var html = """
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>\(content.title)</title>
            <style>\(config.theme.css)</style>
        </head>
        <body>
            <article class="documentation">
                <h1>\(content.title)</h1>
        """
        
        for block in parseResult.blocks {
            html += renderBlock(block)
        }
        
        html += """
            </article>
        </body>
        </html>
        """
        
        return html
    }
    
    private func renderBlock(_ block: DocumentationParser.ContentBlock) -> String {
        switch block {
        case .paragraph(let text):
            return "<p>\(text)</p>"
        case .heading(let level, let text, let id):
            let idAttr = id.map { " id=\"\($0)\"" } ?? ""
            return "<h\(level)\(idAttr)>\(text)</h\(level)>"
        case .codeBlock(let code):
            return "<pre><code class=\"language-\(code.language)\">\(code.code)</code></pre>"
        case .callout(let callout):
            return "<aside class=\"callout callout-\(callout.type.rawValue)\"><p>\(callout.content)</p></aside>"
        case .list(let items, let ordered):
            let tag = ordered ? "ol" : "ul"
            let itemsHTML = items.map { "<li>\($0)</li>" }.joined()
            return "<\(tag)>\(itemsHTML)</\(tag)>"
        case .blockquote(let text):
            return "<blockquote>\(text)</blockquote>"
        case .divider:
            return "<hr>"
        default:
            return ""
        }
    }
    
    private func generateDocC(content: DocumentationContent, parseResult: DocumentationParser.ParseResult) -> String {
        var docc = "# ``\(content.title)``\n\n"
        docc += content.content
        return docc
    }
    
    private func generateJSON(content: DocumentationContent) -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        if let data = try? encoder.encode(content),
           let json = String(data: data, encoding: .utf8) {
            return json
        }
        return "{}"
    }
}

/// Content to be generated.
public struct DocumentationContent: Codable, Sendable {
    public var id: UUID
    public var title: String
    public var slug: String
    public var content: String
    public var type: DocumentationType
    public var metadata: [String: String]
    
    public init(
        id: UUID = UUID(),
        title: String,
        slug: String,
        content: String,
        type: DocumentationType,
        metadata: [String: String] = [:]
    ) {
        self.id = id
        self.title = title
        self.slug = slug
        self.content = content
        self.type = type
        self.metadata = metadata
    }
}

/// Documentation theme configuration.
public struct DocumentationTheme: Sendable {
    public var name: String
    public var primaryColor: String
    public var backgroundColor: String
    public var textColor: String
    public var fontFamily: String
    public var codeFont: String
    public var customCSS: String?
    
    public static let `default` = DocumentationTheme(
        name: "Default",
        primaryColor: "#007AFF",
        backgroundColor: "#FFFFFF",
        textColor: "#1D1D1F",
        fontFamily: "-apple-system, BlinkMacSystemFont, sans-serif",
        codeFont: "SF Mono, Menlo, monospace"
    )
    
    public init(
        name: String,
        primaryColor: String,
        backgroundColor: String,
        textColor: String,
        fontFamily: String,
        codeFont: String,
        customCSS: String? = nil
    ) {
        self.name = name
        self.primaryColor = primaryColor
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.fontFamily = fontFamily
        self.codeFont = codeFont
        self.customCSS = customCSS
    }
    
    public var css: String {
        """
        :root {
            --primary-color: \(primaryColor);
            --background-color: \(backgroundColor);
            --text-color: \(textColor);
            --font-family: \(fontFamily);
            --code-font: \(codeFont);
        }
        body {
            font-family: var(--font-family);
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.6;
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
        }
        code {
            font-family: var(--code-font);
            background: #f5f5f7;
            padding: 0.2em 0.4em;
            border-radius: 4px;
        }
        pre code {
            display: block;
            padding: 1rem;
            overflow-x: auto;
        }
        .callout {
            padding: 1rem;
            border-radius: 8px;
            margin: 1rem 0;
        }
        .callout-note { background: #e3f2fd; border-left: 4px solid #2196f3; }
        .callout-warning { background: #fff3e0; border-left: 4px solid #ff9800; }
        .callout-tip { background: #e8f5e9; border-left: 4px solid #4caf50; }
        \(customCSS ?? "")
        """
    }
}
