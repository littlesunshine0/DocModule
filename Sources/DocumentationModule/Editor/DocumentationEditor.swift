import Foundation

/// Editor state and operations for documentation content.
public final class DocumentationEditor: @unchecked Sendable {
    
    public struct EditorState: Sendable {
        public var content: String
        public var cursorPosition: Int
        public var selection: Range<Int>?
        public var undoStack: [EditorAction]
        public var redoStack: [EditorAction]
        public var isDirty: Bool
        public var lastSaved: Date?
    }
    
    public enum EditorAction: Sendable {
        case insert(position: Int, text: String)
        case delete(range: Range<Int>, deletedText: String)
        case replace(range: Range<Int>, oldText: String, newText: String)
        case format(range: Range<Int>, format: TextFormat)
    }
    
    public enum TextFormat: String, Sendable, CaseIterable {
        case bold, italic, strikethrough, code, link, heading1, heading2, heading3
        case bulletList, numberedList, blockquote, codeBlock, horizontalRule
        
        public var prefix: String {
            switch self {
            case .bold: return "**"
            case .italic: return "_"
            case .strikethrough: return "~~"
            case .code: return "`"
            case .link: return "["
            case .heading1: return "# "
            case .heading2: return "## "
            case .heading3: return "### "
            case .bulletList: return "- "
            case .numberedList: return "1. "
            case .blockquote: return "> "
            case .codeBlock: return "```\n"
            case .horizontalRule: return "---\n"
            }
        }
        
        public var suffix: String {
            switch self {
            case .bold: return "**"
            case .italic: return "_"
            case .strikethrough: return "~~"
            case .code: return "`"
            case .link: return "](url)"
            case .heading1, .heading2, .heading3: return ""
            case .bulletList, .numberedList, .blockquote: return ""
            case .codeBlock: return "\n```"
            case .horizontalRule: return ""
            }
        }
        
        public var shortcut: String {
            switch self {
            case .bold: return "⌘B"
            case .italic: return "⌘I"
            case .strikethrough: return "⌘⇧S"
            case .code: return "⌘E"
            case .link: return "⌘K"
            case .heading1: return "⌘1"
            case .heading2: return "⌘2"
            case .heading3: return "⌘3"
            case .bulletList: return "⌘⇧U"
            case .numberedList: return "⌘⇧O"
            case .blockquote: return "⌘⇧."
            case .codeBlock: return "⌘⇧C"
            case .horizontalRule: return "⌘⇧H"
            }
        }
    }
    
    private var state: EditorState
    
    public init(content: String = "") {
        self.state = EditorState(
            content: content,
            cursorPosition: 0,
            selection: nil,
            undoStack: [],
            redoStack: [],
            isDirty: false,
            lastSaved: nil
        )
    }
    
    public var content: String { state.content }
    public var isDirty: Bool { state.isDirty }
    public var canUndo: Bool { !state.undoStack.isEmpty }
    public var canRedo: Bool { !state.redoStack.isEmpty }
    
    /// Insert text at position.
    public func insert(_ text: String, at position: Int) {
        let action = EditorAction.insert(position: position, text: text)
        state.undoStack.append(action)
        state.redoStack.removeAll()
        
        var content = state.content
        let index = content.index(content.startIndex, offsetBy: min(position, content.count))
        content.insert(contentsOf: text, at: index)
        state.content = content
        state.cursorPosition = position + text.count
        state.isDirty = true
    }
    
    /// Delete text in range.
    public func delete(range: Range<Int>) {
        let startIndex = state.content.index(state.content.startIndex, offsetBy: range.lowerBound)
        let endIndex = state.content.index(state.content.startIndex, offsetBy: min(range.upperBound, state.content.count))
        let deletedText = String(state.content[startIndex..<endIndex])
        
        let action = EditorAction.delete(range: range, deletedText: deletedText)
        state.undoStack.append(action)
        state.redoStack.removeAll()
        
        state.content.removeSubrange(startIndex..<endIndex)
        state.cursorPosition = range.lowerBound
        state.isDirty = true
    }
    
    /// Apply formatting to selection.
    public func applyFormat(_ format: TextFormat, to range: Range<Int>?) {
        guard let range = range ?? state.selection else { return }
        
        let startIndex = state.content.index(state.content.startIndex, offsetBy: range.lowerBound)
        let endIndex = state.content.index(state.content.startIndex, offsetBy: min(range.upperBound, state.content.count))
        let selectedText = String(state.content[startIndex..<endIndex])
        let newText = format.prefix + selectedText + format.suffix
        
        let action = EditorAction.replace(range: range, oldText: selectedText, newText: newText)
        state.undoStack.append(action)
        state.redoStack.removeAll()
        
        state.content.replaceSubrange(startIndex..<endIndex, with: newText)
        state.isDirty = true
    }
    
    /// Insert a snippet template.
    public func insertSnippet(_ snippet: EditorSnippet, at position: Int) {
        insert(snippet.template, at: position)
    }
    
    /// Undo last action.
    public func undo() {
        guard let action = state.undoStack.popLast() else { return }
        state.redoStack.append(action)
        
        switch action {
        case .insert(let position, let text):
            let startIndex = state.content.index(state.content.startIndex, offsetBy: position)
            let endIndex = state.content.index(startIndex, offsetBy: text.count)
            state.content.removeSubrange(startIndex..<endIndex)
            
        case .delete(let range, let deletedText):
            let index = state.content.index(state.content.startIndex, offsetBy: range.lowerBound)
            state.content.insert(contentsOf: deletedText, at: index)
            
        case .replace(let range, let oldText, _):
            let startIndex = state.content.index(state.content.startIndex, offsetBy: range.lowerBound)
            let endIndex = state.content.index(state.content.startIndex, offsetBy: range.upperBound)
            state.content.replaceSubrange(startIndex..<endIndex, with: oldText)
            
        case .format:
            break
        }
    }
    
    /// Redo last undone action.
    public func redo() {
        guard let action = state.redoStack.popLast() else { return }
        state.undoStack.append(action)
        
        switch action {
        case .insert(let position, let text):
            let index = state.content.index(state.content.startIndex, offsetBy: position)
            state.content.insert(contentsOf: text, at: index)
            
        case .delete(let range, _):
            let startIndex = state.content.index(state.content.startIndex, offsetBy: range.lowerBound)
            let endIndex = state.content.index(state.content.startIndex, offsetBy: range.upperBound)
            state.content.removeSubrange(startIndex..<endIndex)
            
        case .replace(let range, _, let newText):
            let startIndex = state.content.index(state.content.startIndex, offsetBy: range.lowerBound)
            let endIndex = state.content.index(state.content.startIndex, offsetBy: range.upperBound)
            state.content.replaceSubrange(startIndex..<endIndex, with: newText)
            
        case .format:
            break
        }
    }
    
    /// Mark content as saved.
    public func markSaved() {
        state.isDirty = false
        state.lastSaved = Date()
    }
}

/// Pre-defined editor snippets.
public enum EditorSnippet: String, CaseIterable, Sendable {
    case codeBlock
    case calloutNote
    case calloutWarning
    case calloutTip
    case table
    case tabGroup
    case collapsible
    case imageGallery
    case apiLink
    case keyboardShortcut
    
    public var displayName: String {
        switch self {
        case .codeBlock: return "Code Block"
        case .calloutNote: return "Note Callout"
        case .calloutWarning: return "Warning Callout"
        case .calloutTip: return "Tip Callout"
        case .table: return "Table"
        case .tabGroup: return "Tab Group"
        case .collapsible: return "Collapsible Section"
        case .imageGallery: return "Image Gallery"
        case .apiLink: return "API Reference Link"
        case .keyboardShortcut: return "Keyboard Shortcut"
        }
    }
    
    public var template: String {
        switch self {
        case .codeBlock:
            return """
            ```swift
            // Your code here
            ```
            """
        case .calloutNote:
            return """
            :::note
            Your note content here.
            :::
            """
        case .calloutWarning:
            return """
            :::warning
            Warning content here.
            :::
            """
        case .calloutTip:
            return """
            :::tip
            Tip content here.
            :::
            """
        case .table:
            return """
            | Header 1 | Header 2 | Header 3 |
            |----------|----------|----------|
            | Cell 1   | Cell 2   | Cell 3   |
            | Cell 4   | Cell 5   | Cell 6   |
            """
        case .tabGroup:
            return """
            :::tabs
            @tab Tab 1
            Content for tab 1.
            
            @tab Tab 2
            Content for tab 2.
            :::
            """
        case .collapsible:
            return """
            :::details[Click to expand]
            Hidden content here.
            :::
            """
        case .imageGallery:
            return """
            :::gallery
            ![Image 1](image1.png)
            ![Image 2](image2.png)
            :::
            """
        case .apiLink:
            return "[[api:SymbolName]]"
        case .keyboardShortcut:
            return "[[kbd:Cmd+Shift+P]]"
        }
    }
}
