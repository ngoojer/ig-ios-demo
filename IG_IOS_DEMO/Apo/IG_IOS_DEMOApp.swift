//
//  IG_IOS_DEMOApp.swift
//  IG_IOS_DEMO
//
//  Created by Narendra on 22/11/21.
//

import SwiftUI

@main
struct IG_IOS_DEMOApp: App {
    var body: some Scene {
        WindowGroup {
            ListView(viewModel: ListViewModel())
        }
    }
}
