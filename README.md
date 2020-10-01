# BoardGameList-CleanArchi
This project is about testing and exploring SwiftUI and Combine using Clean Architecture.

This project follows the architecture described by Alexey Naumov : [Clean Architecture for SwiftUI](https://nalexn.github.io/clean-architecture-swiftui/)

## Clean Architecture

**Clean Architecture** is a popular architecture from Uncle Bob helping code to be
- More testable
- Independant from dependencies

This version of the clean architecture try to keep the SwiftUI engine (with the binding system). So the classic Presenter class is replaced by Binded View for the Presentation Layer. We also use the principle of View-State to define how will be displayed the view.
**View** triggers (with user input or side effects) **Interactor**
**Interactor** uses **Workers**, **Repositories** and updates **ViewState**
**ViewState** updates (by binding) **View**

## API

This project uses an open API [boardgameatlas.com](https://www.boardgameatlas.com/)

## Scenes

Our application contains 2 scenes.

### GamesList

The first scene is a list view with board games from networking request.
Each cell displays name and thumbnail image of a board game.

### GameDetail

The second scene is the detail of board game when clicking in a cell of first scene. 

## Tests

The chosen architecture permit to test easily the each layer.

### Generated

To test our **ViewState**, test equality of **State** which is declared in **Enum** which could contain various type. To avoid boilerplate code by following protocol **Equatable**, we use **Sourcery** to generate equalilty operator.

## Environments

I added fastlane to help us in **Continuous Integration**. We achieved this with environment files (of Ruby) and **.xcconfig** concept to handle our 3 _virtual_ environments (development, staging, production).

## Lessons learned

Clean Architecture is a solid architecture to keep the code clean and testable. 
It is easy to get the idea of what to test in each layer.

