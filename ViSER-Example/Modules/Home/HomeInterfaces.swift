//
//  HomeInterfaces.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/02.
//

import Unio

protocol HomeRouterInterface: RouterInterface {

}

protocol HomeViewInterface: ViewInterface {

}

struct HomeViewDependency {

    struct Input: InputType {

    }

    struct Output: OutputType {

    }

    struct State: OutputType {

    }

    struct Extra: ExtraType {
        let router: HomeRouterInterface
        let view: HomeViewInterface
    }

}
