//
//  Resumen.swift
//  PiggyWings
//
//  Created by Jacobo Osorio on 1/08/23.
//

import SwiftUI

struct ResumenView: View {
    @EnvironmentObject var globalState: GlobalState

    var body: some View {
    
        VStack{
            Text("Ventana del Resumen")
            Spacer()
            Text("Actualmente tienes: \(String(format: "%.2f", globalState.money))")
                .padding()
                .font(Font.body)
            
            Button{
                globalState.money = 0
            }label:{
                Text("Limpiar")                        .foregroundColor(Color.white)
                    .frame(width: 120, height: 45)
                    .background(Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10))
            }
            Spacer()
        }
    }
}

struct ResumenView_Previews: PreviewProvider {
    static let globalState = GlobalState()
    
    static var previews: some View {
        ResumenView()
            .environmentObject(globalState)
    }
}
