//
//  ContentView.swift
//  PiggyWings
//
//  Created by Jacobo Osorio on 1/08/23.
//

import SwiftUI
import CoreData

struct HistorialView: View {
    
    @EnvironmentObject var globalState: GlobalState
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \NewTransaccion.fecha, ascending: true),
            NSSortDescriptor(keyPath: \NewTransaccion.monto, ascending: true),
            NSSortDescriptor(keyPath: \NewTransaccion.comentario, ascending: true),],
        animation: .default)
    private var newTransaccion: FetchedResults<NewTransaccion>
    
    static var fechaFormato = {
        let formato = DateFormatter()
        formato.dateStyle = .full
        return formato
    }()
    
    var fecha = Date()
    
    var body: some View {
        VStack{
            Text("Ventana del Resumen")
            Spacer()
            List{
                ForEach(newTransaccion, id: \.id) { newTransaccion in
                    VStack(alignment: .leading){
                        Text(String(format: "%.2f", newTransaccion.monto))
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}
struct Historial_Previews: PreviewProvider {
    static var previews: some View {
        HistorialView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
