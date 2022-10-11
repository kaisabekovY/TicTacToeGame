//
//  Alerts.swift
//  TacToe
//
//  Created by Yeldar Kaisabekov on 11.10.2022.
//

import SwiftUI

struct AlertItem : Identifiable{
    let id = UUID()
    var title : Text
    var message : Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You Win!"),
                            message: Text("You are so smart!"),
                            buttonTitle: Text("Hell Yeaaahhh!")
                            )
    static let computerWin = AlertItem(title: Text("You Lost!"),
                            message: Text("Try again!"),
                            buttonTitle: Text("Okay:(")
                            )
    static let draw = AlertItem(title: Text("It's a draw"),
                            message: Text("You are smart as computer"),
                            buttonTitle: Text("Try to win again!")
                            )
}
