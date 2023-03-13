//
//  ToggleTextFieldVisibilityViewModel.swift
//  todoList
//
//  Created by Paulo Vitor on 11/03/23.
//

import Foundation

struct TogglePasswordVisibilityViewModel {
    var toggleTextFieldEntry: Bool
    let icon: String

    init(toggleTextFieldEntry: Bool = true, icon: String = "eye.slash") {
        self.toggleTextFieldEntry = toggleTextFieldEntry
        self.icon = icon
    }
    mutating func testee() {
        toggleTextFieldEntry.toggle()
    }
}
