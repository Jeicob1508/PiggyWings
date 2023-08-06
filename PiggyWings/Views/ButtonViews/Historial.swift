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
            NSSortDescriptor(keyPath: \NewTransaccion.comentario, ascending: true),
            NSSortDescriptor(keyPath: \NewTransaccion.tipo, ascending: true),],
        animation: .default)
    private var newTransaccion: FetchedResults<NewTransaccion>
    
    static var fechaFormato = {
        let formato = DateFormatter()
        formato.dateStyle = .long
        formato.timeStyle = .short
        return formato
    }()
    
    static var tipoFormato = {
        
    }
    
    var fecha = Date()
    
    var body: some View {
        VStack{
            Text("Ventana del Historial")
            Spacer()
            List{
                ForEach(newTransaccion, id: \.id) { newTransaccion in
                    HStack{
                        VStack(alignment: .leading){
                            HStack{
                                Image(systemName: "dollarsign")
                                    //.frame(maxWidth: 2)
                                    //.frame(maxHeight: 2)
                                Text(String(format: "%.2f", newTransaccion.monto))
                                    .font(.headline.bold())
                                    .foregroundColor(.primary)
                            }
                            Text("\(newTransaccion.fecha ?? self.fecha, formatter: Self.fechaFormato)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                //.padding(.bottom, 0.2)
                        }
                        Spacer()
                        Text("\(newTransaccion.tipo ? "Gasto" : "Ingreso")")
                        Image(systemName: newTransaccion.tipo ? "minus.circle.fill" : "plus.circle.fill")
                            .foregroundColor(newTransaccion.tipo ? .red : .green)
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
