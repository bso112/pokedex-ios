//
//  HomeReactor.swift
//  Pokedex
//
//  Created by Byeon Seonguk on 2022/09/06.
//

import Foundation
import ReactorKit

class HomeReactor: Reactor {
  // represent user actions
  enum Action {
    case fetchPoketmon
  }

  // represent state changes
  enum Mutation {
    case setFollowing(Bool)
  }

  // represents the current view state
  struct State {
      var poketmonList = [Pokemon]()
  }

  let initialState: State = State()
}
