//
//  TextFieldView.swift
//  ExampleSwiftUIEditListView
//
//  Created by Katsuhiko Terada on 2023/03/23.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var groupBind: TextFieldInfo
    var onCommit: () -> Void

    var body: some View {
        if #available(iOS 15.0, *) {
            TextField("空白はグループ名にできません", text: self.$groupBind.title, onEditingChanged: { _ in
                // print("pushed \(model.name), \(changed)")
            }, onCommit: {
                self.onCommit()
            })
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
        } else {
            TextField("空白はグループ名にできません", text: $groupBind.title, onEditingChanged: { _ in
                // print("pushed \(model.name), \(changed)")
            }, onCommit: {
                onCommit()
            })
            .disableAutocorrection(true)
        }
    }
}

