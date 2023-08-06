//
//  NewTransaccion+CoreDataProperties.swift
//  PiggyWings
//
//  Created by Jacobo Osorio on 6/08/23.
//
//

import Foundation
import CoreData


extension NewTransaccion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewTransaccion> {
        return NSFetchRequest<NewTransaccion>(entityName: "NewTransaccion")
    }

    @NSManaged public var comentario: String?
    @NSManaged public var fecha: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var monto: Double

}

extension NewTransaccion : Identifiable {

}
