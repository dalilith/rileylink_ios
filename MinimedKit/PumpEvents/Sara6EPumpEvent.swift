//
//  Sara6EPumpEvent.swift
//  RileyLink
//
//  Created by Pete Schwamb on 3/8/16.
//  Copyright © 2016 Pete Schwamb. All rights reserved.
//

import UIKit

public class Sara6EPumpEvent: TimestampedPumpEvent {
  
  public var length: Int
  var timestamp: NSDateComponents
  let validDateStr: String
  
  public required init?(availableData: NSData, pumpModel: PumpModel) {
    length = 52

    if length > availableData.length {
      timestamp = NSDateComponents()
      validDateStr = "Invalid"
      return nil
    }
    
    let dateComponents = TimeFormat.parse2ByteDate(availableData, offset: 5)
    validDateStr = String(format: "%04d-%02d-%02d", dateComponents.year, dateComponents.month, dateComponents.day)
    timestamp = TimeFormat.midnightForDate(dateComponents)
  }
  
  public var dictionaryRepresentation: [String: AnyObject] {
    return [
      "_type": "Sara6E",
      "timestamp": TimeFormat.timestampStr(timestamp),
      "validDate": validDateStr,
    ]
  }
}
