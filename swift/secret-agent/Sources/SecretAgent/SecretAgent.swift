func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
    func secretFunction(_ myPassword: String) -> String {
        if password == myPassword {
            return secret
        } else {
            return "Sorry. No hidden secrets here."
        }
    }
    return secretFunction(_:)
}


func generateCombination(forRoom room: Int, usingFunction f: (Int) -> Int) -> (Int, Int, Int) {
    var myCombo = (-1, -1, -1)
    
    myCombo.0 = f(room)
    myCombo.1 = f(myCombo.0)
    myCombo.2 = f(myCombo.1)
    
    return myCombo
}
