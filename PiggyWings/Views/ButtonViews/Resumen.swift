//
//  Resumen.swift
//  PiggyWings
//
//  Created by Jacobo Osorio on 1/08/23.
//

import SwiftUI

struct TransicionDerecha: ViewModifier {
    func body(content: Content) -> some View {
        content
            .transition(.move(edge: .trailing))
    }
}

struct ResumenView: View {
    @EnvironmentObject var globalState: GlobalState
    @State private var mostrar: Bool = false
    
    var body: some View {
        ZStack{
            Color.white // Background color
            VStack {
                Text("Ventana del Resumen")
                
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            mostrar.toggle()
                        }
                    }) {
                        Image(systemName: "gear") // Use the system symbol for gear/tuerca
                            .font(.system(size: 30))
                            .padding()
                            .foregroundColor(.blue) // Example text color
                    }
                }
                Spacer()
                
                Text("Actualmente tienes: \(String(format: "%.2f", globalState.money))")
                    .padding()
                    .font(.body)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Expand the VStack to fill available space
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            if mostrar {
                Configuracion(mostrarConfiguracion: $mostrar)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .transition(AnyTransition.move(edge: .trailing).combined(with: .opacity))
                    .zIndex(1)
            }
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
