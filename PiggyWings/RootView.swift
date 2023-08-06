//
//  RootView.swift
//  PiggyWings
//
//  Created by Jacobo Osorio on 1/08/23.
//

import Foundation
import Combine
import SwiftUI

// Variables Globales
class GlobalState: ObservableObject {
    @Published var money:Double {
        didSet {
            UserDefaults.standard.set(money, forKey: "MoneyKey")
        }
    }
    
    init() {
        self.money = Double(UserDefaults.standard.double(forKey: "MoneyKey"))
    }
    
}

struct RootView: View {
    @StateObject private var globalState = GlobalState()
    
    var body: some View {
        ContentView()
            .environmentObject(globalState)
    }
    
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc
    @State var selectedTab: Tabs = .resumen
     
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ResumenView()
                    .tag(Tabs.resumen)
                
                HistorialView()
                    .tag(Tabs.historial)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Spacer()
            
            CustomTabBar(selectedTab: $selectedTab).environment(\.managedObjectContext, self.moc)
        }
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        let globalState = GlobalState()
        return RootView()
            .environmentObject(globalState)
    }
}
