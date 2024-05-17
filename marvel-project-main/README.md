# Marvel Project

## Introduction
Marvel Project is a project for studying SwiftUI, where an intern applies features and knowledge learned during the first months of the internship. We have two views: Discover, with all the characters from Marvel API, and Favorites, where the users access only their favorite characters. 

## Getting Started
This project follows the MVVM architecture and uses SwiftData, the latest framework for data persistence. For that reason, you'll need Xcode updated to version 15 and iOS 17. Also, two classes have been injected into the viewModels to simplify testing and make it more specific. 

The API used in this project is available at https://developer.marvel.com/docs (/v1/public/characters). To build the views, we used the offset, limit, name, description, image, and sorting information.

## Build and Test
In this project, we implemented unit tests and UI tests using the Page Object Pattern architecture. Both tests follow the naming convention: test_StateUnderTest_ExpectedBehavior.

## Contribute
If you are having difficulty understanding any aspect of the project or the code is not running correctly, you can contact either Luciene Ventura or Clara Muniz. On the other hand, if you wish to introduce new features to the project, you can write your code and send us a pull request (PR) to unlock the merge into the main branch.
