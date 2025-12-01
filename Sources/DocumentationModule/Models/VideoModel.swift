import Foundation
import SwiftData

/// A chapter/timestamp in a video.
public struct VideoChapter: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var title: String
    public var startTime: TimeInterval
    public var endTime: TimeInterval?
    public var description: String?
    
    public init(
        id: UUID = UUID(),
        title: String,
        startTime: TimeInterval,
        endTime: TimeInterval? = nil,
        description: String? = nil
    ) {
        self.id = id
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.description = description
    }
    
    public var formattedStartTime: String {
        let minutes = Int(startTime) / 60
        let seconds = Int(startTime) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

/// A transcript segment for a video.
public struct TranscriptSegment: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var text: String
    public var startTime: TimeInterval
    public var endTime: TimeInterval
    public var speaker: String?
    
    public init(
        id: UUID = UUID(),
        text: String,
        startTime: TimeInterval,
        endTime: TimeInterval,
        speaker: String? = nil
    ) {
        self.id = id
        self.text = text
        self.startTime = startTime
        self.endTime = endTime
        self.speaker = speaker
    }
}

/// A SwiftData model representing video documentation.
@Model
public final class VideoModel {
    public var id: UUID
    public var title: String
    public var summary: String
    public var videoURL: String
    public var thumbnailURL: String?
    public var duration: TimeInterval
    public var chaptersData: Data
    public var transcriptData: Data
    public var category: ContentCategory
    public var tags: [String]
    public var icon: DocumentationIcon
    public var createdAt: Date
    public var updatedAt: Date
    public var userID: String
    public var isPublished: Bool
    public var viewCount: Int
    public var completionCount: Int
    
    public static let color = DocumentationColor.video
    public static let shape = DocumentationShape.stadium
    
    public var chapters: [VideoChapter] {
        get { (try? JSONDecoder().decode([VideoChapter].self, from: chaptersData)) ?? [] }
        set { chaptersData = (try? JSONEncoder().encode(newValue)) ?? Data() }
    }
    
    public var transcript: [TranscriptSegment] {
        get { (try? JSONDecoder().decode([TranscriptSegment].self, from: transcriptData)) ?? [] }
        set { transcriptData = (try? JSONEncoder().encode(newValue)) ?? Data() }
    }
    
    public var formattedDuration: String {
        let minutes = Int(duration) / 60
        let seconds = Int(duration) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    public init(
        id: UUID = UUID(),
        title: String,
        summary: String = "",
        videoURL: String,
        thumbnailURL: String? = nil,
        duration: TimeInterval = 0,
        chapters: [VideoChapter] = [],
        transcript: [TranscriptSegment] = [],
        category: ContentCategory = .fundamentals,
        tags: [String] = [],
        icon: DocumentationIcon = .video,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        userID: String = "",
        isPublished: Bool = false,
        viewCount: Int = 0,
        completionCount: Int = 0
    ) {
        self.id = id
        self.title = title
        self.summary = summary
        self.videoURL = videoURL
        self.thumbnailURL = thumbnailURL
        self.duration = duration
        self.chaptersData = (try? JSONEncoder().encode(chapters)) ?? Data()
        self.transcriptData = (try? JSONEncoder().encode(transcript)) ?? Data()
        self.category = category
        self.tags = tags
        self.icon = icon
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userID = userID
        self.isPublished = isPublished
        self.viewCount = viewCount
        self.completionCount = completionCount
    }
}
