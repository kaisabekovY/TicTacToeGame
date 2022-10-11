//
//  GameView.swift
//  TacToe
//
//  Created by Yeldar Kaisabekov on 10.10.2022.
//

import SwiftUI

struct GameView:View {
        
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                LazyVGrid(columns: viewModel.columns,spacing: 5){
                    ForEach(0..<9){ i in
                        ZStack{
                            GameCircleView(proxy: geometry)
                            PlayerIndicator(systemImageName: viewModel.moves[i]?.indicator ?? "")
                        }
                        //Tap this
                        .onTapGesture {
                            viewModel.processPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
            }
            .disabled(viewModel.isGameBoardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem, content: {alertItem in Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: { viewModel.resetGame() }))})
        }
        .background(Color.black)
    }
    
    //Occupied or not check
    
}

enum Player{
    case human , computer
}

struct Move{
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        if player == .human{
            return "xmark"
        } else {
            return "circle"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct GameCircleView: View {
    
    var proxy: GeometryProxy
    var body: some View {
        Circle()
            .foregroundColor(.red).opacity(0.8)
            .frame(width: proxy.size.width/3-15,
                   height: proxy.size.width/3-15)
    }
}

struct PlayerIndicator: View {
    var systemImageName: String
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}
