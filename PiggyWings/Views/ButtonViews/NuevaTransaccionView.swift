//
//  NuevaTransaccionView.swift
//  PiggyWings
//
//  Created by Jacobo Osorio on 1/08/23.
//

import SwiftUI

struct NuevaTransaccionView: View {
    
    //@EnvironmentObject var dataController: DataController
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var globalState: GlobalState
    @Binding var isShowingPopUp: Bool
    @State private var txtMonto: String = ""
    @State private var txtComnt: String = ""
    @State private var toggleMonto: Bool = true
    @State private var toggleComnt: Bool = true
    
    // Variables para la base de datos
    @State private var monto = 0.0
    @State private var tipo = true
    @State private var comentario = ""
    
    //Cerrar el Popup
    //@Environment(\.presentationMode) var presentationMode
    
    //Cerrar el popup --> Agregar en el boton
    //presentationMode.wrappedValue.dismiss()
    
    var body: some View {
        
        VStack{
            
            Text("Nueva Transaccion")
                .font(.headline)
                .padding()
            
            Spacer()
            TextField("Cantidad", text: $txtMonto)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()
            
            HStack{
                HStack{
                    Spacer()
                    Toggle("Comentario", isOn: $toggleComnt)
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                HStack{
                    if toggleComnt{
                        TextField("Comentario", text: $txtComnt)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .padding()
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .frame(minHeight: 0, maxHeight:30)
            .padding()
            .onChange(of: toggleComnt){ nuevoValor in
                if !nuevoValor{
                    txtComnt = ""
                }
            }
            
            HStack {
                HStack{
                    Spacer()
                    Text("Ingreso")
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                Toggle("", isOn: $toggleMonto)
                    .labelsHidden()
                HStack{
                    Spacer()
                    Text("Gasto")
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .padding(.vertical)
            
            HStack{
                // Boton para cerrar
                Spacer()
                Button{
                    isShowingPopUp = false
                }label:{
                    Text("Cerrar")
                        .foregroundColor(Color.white)
                        .frame(width: 120, height: 45)
                        .background(Rectangle()
                            .foregroundColor(.black)
                            .cornerRadius(10))
                }
                .padding()
                Spacer()
                
                // Boton de Agregar Transaccion
                Spacer()
                Button{
                    isShowingPopUp = false
                    if let inputValueAsDouble = Double(txtMonto) {
                        if toggleMonto{
                            globalState.money -= inputValueAsDouble
                        }else{
                            globalState.money += inputValueAsDouble
                        }
                    }
                    
                    monto = Double(txtMonto) ?? 0.00
                    
                    comentario = txtComnt
                    tipo = toggleMonto
                    
                    print("El monto es: \(monto), el comentario es: \(comentario), el tipo es \(tipo)")
                    
                    //DataController().agregar(comentario: comentario,monto: monto,tipo:tipo,context: moc)
                    dismiss()
                    
                    txtMonto = ""
                    txtComnt = ""
                    
                }label:{
                    Text(toggleMonto ? "Restar" : "Agregar")
                        .foregroundColor(Color.white)
                        .frame(width: 120, height: 45)
                        .background(Rectangle()
                            .foregroundColor(.black)
                            .cornerRadius(10))
                }
                .padding()
                Spacer()
            }
        }
        // Color del fondo -> Cambiar cuando se seleccione tema oscuro o claro
        .background(Color.white)
    }

}

struct NuevaTransaccionView_Previews: PreviewProvider {
    
    @State static var isShowingPopUp = false
    static let globalState = GlobalState()

    static var previews: some View {
        return NuevaTransaccionView(isShowingPopUp: $isShowingPopUp)
            .environmentObject(globalState)
    }
}


/*

 Notas:
 
 - Agregar el boton de comentario y/o titulo
 - Agregar el historial
 - Agregar un lapiz para modificar las transacciones
 
*/
