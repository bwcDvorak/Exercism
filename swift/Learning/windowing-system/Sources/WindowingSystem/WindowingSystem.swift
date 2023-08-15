import Foundation

// TODO: Define the Position struct
struct Position {
    var x = 0
    var y = 0
    
    mutating func moveTo(newX: Int, newY: Int) {
        x = newX
        y = newY
    }
}



// TODO: Define the Size struct
struct Size {
    var width = 80
    var height = 60
    
    mutating func resize(newWidth: Int, newHeight: Int) {
        width = newWidth
        height = newHeight
    }
}


// TODO: Define the Window class
class Window {
        
    static var screenSize = Size(width: 800, height: 600)
    
    var title = "New Window"
    var size = Size()
    var position = Position()
    var contents: String?
    
    func resize(to: Size) -> () {
        if (to.width > 1) {
            self.size.width = (self.position.x + to.width) <= Window.screenSize.width ? to.width : (Window.screenSize.width - position.x)
        } else {
            size.width = 1
        }

        if (to.height > 1) {
            self.size.height = (self.position.y + to.height) <= Window.screenSize.height ? to.height : (Window.screenSize.height - position.y)
        } else {
            size.height = 1
        }
    }
    
    func move(to: Position) -> () {
        if (to.x > 0) {
            self.position.x = (to.x + self.size.width) <= Window.screenSize.width ? to.x : (Window.screenSize.width - self.size.width)
        } else {
            position.x = 0
        }
        
        if (to.y > 0) {
            self.position.y = (to.y + self.size.height) <= Window.screenSize.height ? to.y : (Window.screenSize.height - self.size.height)
        } else {
            self.position.y = 0
        }
    }
    
    func update(title: String) -> () {
        self.title = title
    }
    
    func update(text: String?) -> () {
        self.contents = text ?? nil
    }
    
    func display() -> String {
        var myString: String = self.title
        let myContents = self.contents ?? "[This window intentionally left blank]"

        myString += "\nPosition: ("
        myString += String(self.position.x)
        myString += ", " + String(self.position.y)
        myString += "), Size: (" + String(self.size.width)
        myString += " x " + String(self.size.height) + ")\n" + myContents + "\n"
        return myString
    }
    
}

let mainWindow: Window = {
    let myWindow = Window()
    myWindow.update(title: "Main Window")
    myWindow.update(text: "This is the main window")
    myWindow.size = Size(width: 400, height: 300)
    myWindow.position = Position(x: 100, y: 100)
    return myWindow
}()
