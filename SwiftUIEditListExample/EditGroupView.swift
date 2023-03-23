//
//  ContentView.swift
//  ExampleSwiftUIEditListView
//
//  Created by Katsuhiko Terada on 2023/03/22.
//

import SwiftUI

@MainActor
struct EditGroupView: View {
    @State var groupState: [TextFieldInfo] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(groupState.indices, id: \.self) { index in
                    TextFieldView(groupBind: $groupState[index]) {
                        
                    }
                }
                .onMove(perform: moveRow)
                .onDelete(perform: removeRow)
            }
            .environment(\.editMode, .constant(.active)) // 編集モードにする
        }
        .onAppear {
            groupState = [
                .init(id: 0, title: "Alice"),
                .init(id: 1, title: "Bob"),
                .init(id: 2, title: "Steve"),
                .init(id: 3, title: "Olivia"),
                .init(id: 4, title: "Emma"),
                .init(id: 5, title: "Amelia"),
                .init(id: 6, title: "Sophia"),
                .init(id: 7, title: "Charlotte"),
                
                .init(id: 8, title: "Noah"),
                .init(id: 9, title: "Liam"),
                .init(id: 10, title: "Oliver"),
                .init(id: 11, title: "James"),
                .init(id: 12, title: "Lucas"),
                .init(id: 13, title: "Mateo"),
                .init(id: 14, title: "Benjamin"),
                .init(id: 15, title: "Elijah"),
            ]
        }
        .onDisappear {
            // 永続化されていない場合にアラートなどを表示
        }
        .onChange(of: groupState) { temporallyGroups in
            // 永続化などの処理をしても良い
        }
    }

    private func moveRow(from source: IndexSet, to destination: Int) {
        groupState.move(fromOffsets: source, toOffset: destination)
    }

    private func removeRow(from source: IndexSet) {
        groupState.remove(atOffsets: source)

        print(groupState)
    }
}

struct EditGroupView_Previews: PreviewProvider {
    static var previews: some View {
        EditGroupView()
    }
}
