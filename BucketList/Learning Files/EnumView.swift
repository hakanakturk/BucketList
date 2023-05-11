//
//  EnumView.swift
//  BucketList
//
//  Created by Hakan Aktürk on 12.01.2023.
//

import Foundation
import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading")
    }
}


struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct EnumView: View {
    var loadingState = LoadingState.loading
    var body: some View {
        switch loadingState  {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}
