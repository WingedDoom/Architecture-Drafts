//
// Created by Bulat Khabirov on 30.04.17.
// Copyright (c) 2017 UveeStudio. All rights reserved.
//
// I've put all the global routing logic here
// so that you can let this class know about currently presenting parent controller.
// This will let you to show global alerts or return to login controller,
// when something like "session expired" error occurs during server request.

import UIKit

class AppRouter {
    static let shared = AppRouter()
    var currentViewController: AppRoutable?
}

protocol AppRoutable {
    func setAppeared()
}

extension AppRoutable where Self: UIViewController {
    func setAppeared() {
        AppRouter.shared.currentViewController = self
    }
}

extension UIViewController: AppRoutable {}
