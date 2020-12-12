//
//  MainInterfaces.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/07.
//

import Unio
import RxSwift
import RxCocoa

protocol MainRouterInterface: RouterInterface {

}

protocol MainViewInterface: ViewInterface {

}

struct MainViewDependency {

    struct Input: InputType {

    }

    struct Output: OutputType {

    }

    struct Extra: ExtraType {
        let router: MainRouterInterface
        let view: MainViewInterface
    }

}

protocol MainViewStreamType {
    var input: InputWrapper<MainViewDependency.Input> { get }
    var output: OutputWrapper<MainViewDependency.Output> { get }
}
