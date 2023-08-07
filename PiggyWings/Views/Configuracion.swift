//
//  Configuracion.swift
//  PiggyWings
//
//  Created by Jacobo Osorio on 6/08/23.
//

import SwiftUI

struct Configuracion: View {
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        VStack {
            Text("Ventana de Configuración")
            HStack{
                Button(action: {
                    withAnimation {
                        globalState.config.toggle()
                    }
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 30))
                        .padding()
                        .foregroundColor(.red)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .padding()
    }
}

struct Configuracion_Previews: PreviewProvider {
    static var previews: some View {
        Configuracion()
            .transition(AnyTransition.move(edge: .trailing).combined(with: .opacity))
    }
}
