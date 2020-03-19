//
//  OPMLExporter.swift
//  NetNewsWire
//
//  Created by Brent Simmons on 12/22/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import Account
import RSCore

struct OPMLExporter {

	static func OPMLString(with account: Account, title: String) -> String {

		let escapedTitle = title.escapingSpecialXMLCharacters
		let openingText =
			"""
			<?xml version="1.0" encoding="UTF-8"?>
			<!-- OPML generated by NetNewsWire -->
			<opml version="1.1">
				<head>
					<title>\(escapedTitle)</title>
				</head>
			<body>
			
			"""

		let middleText = account.OPMLString(indentLevel: 0, allowCustomAttributes: false)

		let closingText =
			"""
				</body>
			</opml>
			"""

		let opml = openingText + middleText + closingText
		return opml
	}
}
