//
// Created by Bulat Khabirov on 30.04.17.
// Copyright (c) 2017 UveeStudio. All rights reserved.
//

import Foundation

/// This class helps ViewController class to fetch data from a hypothetical source.
/// One should create such classes for fetching data from local storage or internet server.
/// It basically takes out Controller's logic of fetching Model objects from somewhere. So it's a part of Controller module
class DataFetchService {
    func generateTemplateData() -> [PersonModel] {
        var personList = [PersonModel]()

        personList.append(PersonModel(name: "Ренат", birthDate: Date()))
        personList.append(PersonModel(name: "Булат", birthDate: Date()))
        personList.append(PersonModel(name: "Илья", birthDate: Date()))
        personList.append(PersonModel(name: "Никита", birthDate: Date()))

        return personList
    }
}
