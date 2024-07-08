//
//  MeasuremetFormatter+Extensions.swift
//  NearMe
//
//  Created by Lavkush kumar on 08/07/24.
//

import Foundation

extension MeasurementFormatter {
    static var distance: MeasurementFormatter {
        let formatter =  MeasurementFormatter()
        formatter.unitStyle = .medium
        formatter.unitOptions =  .naturalScale
        formatter.locale = Locale.current
        return formatter
    }
}
