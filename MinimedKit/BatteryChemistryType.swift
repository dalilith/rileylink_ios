//
//  BatteryChemistryType.swift
//  RileyLink
//
//  Created by Jeremy Lucas on 11/15/16
//  Copyright © 2016 LoopKit Authors. All rights reserved.
//

import Foundation

public enum BatteryChemistryType: Int, CustomStringConvertible {
    case alkaline = 0
    case lithium

    public var description: String {
        switch self {
        case .alkaline:
            return NSLocalizedString("Alkaline", comment: "Describing the battery chemistry as Alkaline")
        case .lithium:
            return NSLocalizedString("Lithium", comment: "Describing the battery chemistry as Lithium")
        }
    }

    public var maxVoltage: Double {
        switch self {
        case .alkaline:
            return 1.47
        case .lithium:
            return 1.58
        }
    }

    public var minVoltage: Double {
        switch self {
        case .alkaline:
            return 1.20
        case .lithium:
            return 1.32
        }
    }

    public func chargeRemaining(voltage: Double) -> Double {
        let computed = (voltage - self.minVoltage)/(self.maxVoltage - self.minVoltage)
        return max(min(computed, 1), 0)
    }
}
