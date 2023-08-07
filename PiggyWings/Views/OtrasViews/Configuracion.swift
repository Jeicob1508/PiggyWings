//
//  Configuracion.swift
//  PiggyWings
//
//  Created by Jacobo Osorio on 6/08/23.
//

import SwiftUI
import CoreData


struct Configuracion: View {
    @EnvironmentObject var globalState: GlobalState
    @Environment(\.managedObjectContext) private var moc

    var body: some View {
        VStack {
            Text("Ventana de Configuración")
            HStack {
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
            
            Button(action: {
                deleteAllItems()
            }) {
                Text("Eliminar Todos")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
    
    // Eliminar todos los elementos de Core Data
    func deleteAllItems() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NewTransaccion.fetchRequest()
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            globalState.money = 0.00
            try moc.execute(batchDeleteRequest)
            try moc.save()
        } catch {
            print("Error deleting items: \(error)")
        }
    }
}

struct Configuracion_Previews: PreviewProvider {
    static var previews: some View {
        Configuracion()
            .transition(AnyTransition.move(edge: .trailing).combined(with: .opacity))
    }
}
