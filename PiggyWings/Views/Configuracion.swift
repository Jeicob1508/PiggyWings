//
//  Configuracion.swift
//  PiggyWings
//
//  Created by Jacobo Osorio on 6/08/23.
//

import SwiftUI

struct Configuracion: View {
    @Binding var mostrarConfiguracion: Bool // Binding to control the visibility
    
    var body: some View {
        VStack {
            Text("Ventana de Configuración")
            HStack{
                Button(action: {
                    withAnimation {
                        mostrarConfiguracion.toggle() // Toggle the binding to close the view
                    }
                }) {
                    Image(systemName: "chevron.backward") // Use the system symbol for "X"
                        .font(.system(size: 30))
                        .padding()
                        .foregroundColor(.red) // Example text color
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
        Configuracion(mostrarConfiguracion: .constant(false))
            .transition(AnyTransition.move(edge: .trailing).combined(with: .opacity))
    }
}
