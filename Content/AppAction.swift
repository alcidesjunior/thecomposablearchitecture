import ComposableArchitecture
import Foundation

enum AppAction: Equatable {
    case adicionarItem
    case textoMudou(String)
    case produtoComprado(index: Int)
}
