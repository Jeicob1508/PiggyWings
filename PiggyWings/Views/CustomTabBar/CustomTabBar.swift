//
//  CustomTabBar.swift
//  PiggyWings
//
//  Created by Jacobo Osorio on 1/08/23.
//

import SwiftUI

enum Tabs: Int{
    case resumen = 0
    case historial = 1
}

struct CustomTabBar: View {
    
    @EnvironmentObject var globalState: GlobalState
    @Binding var selectedTab: Tabs
    @State private var isShowingPopUp = false
    
    var body: some View {
        
        HStack (alignment: .center){
            
            Button {
                selectedTab = .resumen
                //
            } label: {
                //
                
                TabBarButton(buttonText: "Resumen", imageName: "dollarsign.circle", isActive: selectedTab == .resumen, imageBigger: true)
                
                /*
                GeometryReader { geo in
                    
                    if selectedTab == .chats {
                        
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(width: geo.size.width/2, height: 4)
                            .padding(.leading, geo.size.width/4)
                    }
                    
                        VStack (alignment: .center, spacing: 4) {
                            Image(systemName: "bubble.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            
                            Text("Chats")
                            // Agregar el archivo Helpers
                            //.font(Font.)
                            
                        }
                        
                        .frame(width: geo.size.width, height: geo.size.height)

                }
                 */
            }
            //Agregar el archivo
            //.tint(Color("icons-secundary"))
            
            Button {
                //
                isShowingPopUp = true
            } label: {
                
                GeometryReader { geo in
                    
                    
                    VStack (alignment: .center, spacing: 4) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        
                        Text("Nuevo")
                        // Agregar el archivo Helpers
                        //.font(Font.)
                    }
                 
                    .frame(width: geo.size.width, height: geo.size.height)
                }
                .sheet(isPresented: $isShowingPopUp, content:{
                    NuevaTransaccionView(isShowingPopUp: $isShowingPopUp)
                        .environmentObject(globalState)
                })
                
                Spacer()
            }
            
            Button {
                selectedTab = .historial
                //
            } label: {
                //
                
                TabBarButton(buttonText: "Historial", imageName: "list.bullet.rectangle.portrait", isActive: selectedTab == .historial, imageBigger: false)
                
                /*
                GeometryReader { geo in
                    
                    if selectedTab == .contacts{
                        
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(width: geo.size.width/2, height: 4)
                            .padding(.leading, geo.size.width/4)
                        
                    }
                        
                        VStack (alignment: .center, spacing: 4) {
                            
                            
                            Image(systemName: "person")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            
                            Text("Contacts")
                            // Agregar el archivo Helpers
                            //.font(Font.)
                        }
                        
                        .frame(width: geo.size.width, height: geo.size.height)

                }
                 */
                    
            }
            //Agregar el archivo
            //.tint(Color("icons-secundary"))

            
        }
        .frame(height: 82)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.resumen))
    }
}
