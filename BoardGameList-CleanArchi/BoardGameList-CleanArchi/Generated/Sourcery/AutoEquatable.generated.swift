// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length

// MARK: - AutoEquatable for Enums
// MARK: - GameDetailState AutoEquatable
extension GameDetailState: Equatable {}
func == (lhs: GameDetailState, rhs: GameDetailState) -> Bool {
    switch (lhs, rhs) {
    case (.loading, .loading):
        return true
    case (.loaded(let lhs), .loaded(let rhs)):
        return lhs == rhs
    default: return false
    }
}
// MARK: - GamesListState AutoEquatable
extension GamesListState: Equatable {}
func == (lhs: GamesListState, rhs: GamesListState) -> Bool {
    switch (lhs, rhs) {
    case (.loading, .loading):
        return true
    case (.error(let lhs), .error(let rhs)):
        return lhs.isEqual(to: rhs)
    case (.loaded(let lhs), .loaded(let rhs)):
        return lhs == rhs
    default: return false
    }
}
