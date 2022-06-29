import Foundation

func sliceSize(diameter: Double?, slices: Int?) -> Double? {
    // guard ((diameter != nil) && (slices != nil)) else {return nil}
   
    guard let myDiam    = diameter,
          let mySlices  = slices,
          myDiam >= 0,
          mySlices > 0
    else {
        return nil
    }
    
    let radius = myDiam / 2
    let rSquared = pow(radius, 2)
    
    return .pi * rSquared / Double(mySlices)
}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
) -> String {
    let myDiamA   = Double(diameterA)
    let mySlicesA = Int(slicesA)
    let myDiamB   = Double(diameterB)
    let mySlicesB = Int(slicesB)
    
    let areaSliceA = sliceSize(diameter: myDiamA, slices: mySlicesA) ?? -100
    let areaSliceB = sliceSize(diameter: myDiamB, slices: mySlicesB) ?? -100

    guard areaSliceA != areaSliceB else { return "Neither slice is bigger"}
    guard areaSliceA > areaSliceB else { return "Slice B is bigger"}
    guard areaSliceA < areaSliceB else { return "Slice A is bigger"}
    
    return "Brian how the hell did you hit this code?"
}
