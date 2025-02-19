//
//  IdealSize.swift
//  IdealSizeIOS
//
//  Created by Mikhail on 19.02.2025.
//

import SwiftUI

/// Size of the Clothes
public enum SizeEnum: String, Sendable {
    case S
    case M
    case L
    case XL
}

public enum IdealSizeError: Error {
    /// BMI value is outside of reasonable range 1-60
    case invalidBMI
}

public struct IdealSize {
    /**
     * Calculates the Body Mass Index (BMI) based on height and weight.
     *
     * @param height Height in centimeters.
     * @param weight Weight in kilograms.
     * @return Calculated BMI.
     */
    public static func calculateBMI(with height: Float, with weight: Float) -> Float {
        let heightInMeters = height / 100
        return weight / (heightInMeters * heightInMeters)
    }

    /**
    Provides Recommended Size based on the BMI (Body Mass Index)
    - parameter bmi: Body Mass Index
    - throws: An error of type IdealSizeError when BMI value is outside of reasonable range 1-60
    - returns: Recommended size (type SizeEnum)
    */
    public static func sizeByBMI(with bmi: Float) throws -> SizeEnum {
        if bmi < 1 || bmi >= 60 {
            throw IdealSizeError.invalidBMI
        }

        if bmi < 18.5 { return SizeEnum.S }
        if bmi < 25 { return SizeEnum.M }
        if bmi < 30 { return SizeEnum.L }

        return SizeEnum.XL
    }
}
