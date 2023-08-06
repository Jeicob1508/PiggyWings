//
//  Resumen.swift
//  PiggyWings
//
//  Created by Jacobo Osorio on 1/08/23.
//

import SwiftUI

struct ResumenView: View {
    
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
                ForEach(NewTransaccion, id: \.id) { newTransaccion in
                    VStack(alignment: .leading){
                        Text(String(format: "%.2f", newTransaccion.monto))
                            .foregroundColor(.primary)
                    }
                }
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
