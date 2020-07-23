import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    let store: Store<AppState, AppAction>

    var body: some View {
        NavigationView {

            WithViewStore(self.store) { viewStore in
                List {
                    HStack {
                        TextField(
                            "Novo produto",
                            text: viewStore.binding(
                                get:  { $0.nomeProduto },
                                send: { .textoMudou($0) }
                            )
                        )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer()
                        Button(action: {
                            viewStore.send(.adicionarItem)
                        }) {
                            Image(systemName: "plus")
                        }
                        .padding(10)
                        .background(Color.red)
                        .clipShape(Circle())
                        .foregroundColor(Color.white)
                        .buttonStyle(PlainButtonStyle())
                    }

                    ForEach(Array(viewStore.itens.enumerated()), id: \.element.id) { index, item in
                        HStack {
                            Button(action: {
                                viewStore.send(.produtoComprado(index: index))
                            }) {
                                Image(systemName: item.comprado ? "checkmark.square" : "square")
                            }
                            .buttonStyle(PlainButtonStyle())
                            Text(item.produto)
                        }
                        .foregroundColor(item.comprado ? .gray : nil)
                    }
                }
                .navigationBarTitle("Compras do mês")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store:
            .init(
                initialState: AppState(
                    itens: []
                ),
                reducer: AppReducer,
                environment: AppEnvironment()
            )
        )
    }
}
