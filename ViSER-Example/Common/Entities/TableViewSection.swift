//
//  TableViewSection.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/02.
//

import RxDataSources

struct TableViewSection<T> {

    var items: [T] = []
    var header: String?
    var footer: String?

}

extension TableViewSection: SectionModelType {

    typealias Item = T

    init(original: TableViewSection, items: [Item]) {
        self = original
        self.items = items
    }

}
