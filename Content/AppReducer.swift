import ComposableArchitecture
import Foundation
// Aqui usaremos toda a lógica da nossa aplicação
let AppReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    switch action {
    case .adicionarItem:
        state.itens.append(.init(produto: state.nomeProduto))
        state.nomeProduto = ""
        return .none
    case let .textoMudou(nomeProduto):
        state.nomeProduto = nomeProduto
        return .none
    case let .produtoComprado(index):
        state.itens[index].comprado.toggle()
        return .none
    }
}
