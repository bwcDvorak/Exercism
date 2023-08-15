import Foundation

func cartesianToPolar(_ cart: (x: Double, y: Double)) -> (r: Double, phi: Double) {
    let myR   = (cart.x * cart.x + cart.y * cart.y).squareRoot()
    let myPhi = atan2(cart.y, cart.x)
    let polar: (Double, Double) = (myR, myPhi)

    return polar
}

func combineRecords(
  production: (toy: String, id: Int, productLead: String),
  gifts: (Int, [String])
) -> (id: Int, toy: String, productLead: String, recipients: [String]) {

    let combined: (Int, String, String, [String]) = (production.id, production.toy, production.productLead, gifts.1)
    return combined
}
