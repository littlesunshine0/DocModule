import Foundation
import SwiftData

/// Convenience helpers for configuring SwiftData containers for the module.
///
/// Consumers can reuse the shared container, create isolated in-memory
/// containers for previews or tests, or build custom containers that still use
/// the canonical module schema.
public enum DocumentationPersistenceController {
    /// Shared singleton container for apps that want a default configuration.
    public static let shared: ModelContainer = {
        let schema = Schema(DocumentationModelRegistry.allModels)
        return try! ModelContainer(for: schema)
    }()

    /// Schema containing all documentation models.
    public static var schema: Schema {
        Schema(DocumentationModelRegistry.allModels)
    }

    /// Creates an in-memory container suitable for previews or ephemeral tasks.
    public static func inMemory() -> ModelContainer {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let schema = Schema(DocumentationModelRegistry.allModels)
        return try! ModelContainer(for: schema, configurations: configuration)
    }

    /// Creates a container with a custom configuration but the same schema.
    public static func makeContainer(configuration: ModelConfiguration) -> ModelContainer {
        let schema = Schema(DocumentationModelRegistry.allModels)
        return try! ModelContainer(for: schema, configurations: configuration)
    }
}
