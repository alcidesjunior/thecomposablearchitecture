import ComposableArchitecture
import Foundation

struct AppState: Equatable {
    var itens: [Item]
    var nomeProduto: String = ""
}

struct Item: Equatable {
    var id = UUID()
    var produto: String
    var comprado: Bool = false
}
