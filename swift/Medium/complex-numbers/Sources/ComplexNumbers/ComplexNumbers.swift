//Solution goes in Sources

import Foundation

public struct ComplexNumber {
    var realComponent: Double
    var imaginaryComponent: Double

    init(realComponent: Double, imaginaryComponent: Double) {
        self.realComponent = realComponent
        self.imaginaryComponent = imaginaryComponent
    }

    func getRealComponent() -> Double {
        return realComponent
    }

    func getImaginaryComponent() -> Double {
        return imaginaryComponent
    }

    func add(complexNumber: ComplexNumber) -> ComplexNumber {
        return ComplexNumber(
            realComponent: self.realComponent + complexNumber.realComponent,
            imaginaryComponent: self.imaginaryComponent + complexNumber.imaginaryComponent
        )
    }

    func subtract(complexNumber: ComplexNumber) -> ComplexNumber {
        return ComplexNumber(
            realComponent: self.realComponent - complexNumber.realComponent,
            imaginaryComponent: self.imaginaryComponent - complexNumber.imaginaryComponent
        )
    }

    func multiply(complexNumber: ComplexNumber) -> ComplexNumber {
        return ComplexNumber(
            realComponent: self.realComponent * complexNumber.realComponent - self.imaginaryComponent * complexNumber.imaginaryComponent,
            imaginaryComponent: self.realComponent * complexNumber.imaginaryComponent + self.imaginaryComponent * complexNumber.realComponent
        )
    }

    func divide(complexNumber: ComplexNumber) -> ComplexNumber {
        let denominator = complexNumber.realComponent * complexNumber.realComponent + complexNumber.imaginaryComponent * complexNumber.imaginaryComponent
        let realPart = (self.realComponent * complexNumber.realComponent + self.imaginaryComponent * complexNumber.imaginaryComponent) / denominator
        let imaginaryPart = (self.imaginaryComponent * complexNumber.realComponent - self.realComponent * complexNumber.imaginaryComponent) / denominator

        return ComplexNumber(realComponent: realPart, imaginaryComponent: imaginaryPart)
    }

    func absolute() -> Double {
        return sqrt(realComponent * realComponent + imaginaryComponent * imaginaryComponent)
    }

    func conjugate() -> ComplexNumber {
        return ComplexNumber(realComponent: realComponent, imaginaryComponent: -imaginaryComponent)
    }

    func exponent() -> ComplexNumber {
        let expReal = exp(realComponent)
        return ComplexNumber(
            realComponent: expReal * cos(imaginaryComponent),
            imaginaryComponent: expReal * sin(imaginaryComponent)
        )
    }
}
