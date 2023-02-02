//  main.swift
//  RightTriangleSolver
//
//  Created by admin on 9/5/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

// initialize the measurements
// variables for the angles
// initialize the measurements
// variables for the angles

var calcAngleA : Double = 0.0
var calcAngleB : Double = 0.0
var calcAngleC : Double = 0.0

// variables for the sides

var calcSideA : Double = 0.0
var calcSideB : Double = 0.0
var calcSideC : Double = 0.0

// side and angle counters

var numOfSides : Int = 0
var numOfAngles : Int = 0

//Boolean variables to use for the CONTROL FLOW

var isRight : Bool = false
var isThreeSides : Bool = false
var isTwoAngles : Bool = false
var isOneAngle : Bool = false
var isTriangle : Bool = false

//Setup a constant for pi

let pi = 3.14159

//Arrays for ordering measurements

var sideMeasurements: [Double] = []
var angleMeasurements: [Double] = []

//Make clear angle in degree is being made into radian

func Radian(degree: Double) -> Double {
  return degree * pi / 180
}

print("Welcome to the right triangle solver!")
print("Please enter three measurements from your triangle.")

//prompt user for side and angle measurements
print("Enter Side a (or 0 if unknown):")
calcSideA = Double(readLine()!)!
if calcSideA != 0 {
  numOfSides += 1
  sideMeasurements.append(calcSideA)
} else {
  sideMeasurements.append(calcSideA)
}

print("Enter Side b (or 0 if unknown):")
calcSideB = Double(readLine()!)!
if calcSideB != 0 {
  numOfSides += 1
  sideMeasurements.append(calcSideB)
} else {
  sideMeasurements.append(calcSideB)
}

print("Enter Side c (or 0 if unknown):")
calcSideC = Double(readLine()!)!
if calcSideC != 0 {
  numOfSides += 1
  sideMeasurements.append(calcSideC)
} else {
  sideMeasurements.append(calcSideC)
}


if numOfSides != 3 {
  print("Enter Angle A (or 0 if unknown):")
  calcAngleA = Double(readLine()!)!
  if calcAngleA != 0 {
    numOfAngles += 1
    calcAngleA = Radian(degree: calcAngleA)
    angleMeasurements.append(calcAngleA)
  } else {
    angleMeasurements.append(calcAngleA)
  }

  print("Enter Angle B (or 0 if unknown):")
  calcAngleB = Double(readLine()!)!
  if calcAngleB != 0 {
    numOfAngles += 1
    calcAngleB = Radian(degree: calcAngleB)
    angleMeasurements.append(calcAngleB)
  } else {
    angleMeasurements.append(calcAngleB)
  }

  print("Enter Angle C (or 0 if unknown):")
  calcAngleC = Double(readLine()!)!
  if calcAngleC != 0 {
    numOfAngles += 1
    calcAngleC = Radian(degree: calcAngleC)
    angleMeasurements.append(calcAngleC)
  } else {
    angleMeasurements.append(calcAngleC)
  }
}

//Determine what type of measurements that you have been given. ie two sides and 1 angle, 3 sides, 2 angles and 1 side

func DetermineType() {
  if numOfSides == 3 && numOfAngles == 0 {
    isThreeSides = true
  } else if numOfAngles == 2 && numOfSides == 1 {
    isTwoAngles = true
  } else if numOfAngles == 1 && numOfSides == 2 {
    isOneAngle = true
  } else {
    //3 angles is a failure case
    print("You need to give at least one side measurement!")
  }
}

DetermineType()

//Order the sides and angles (make sure that the largest angle is angle C)

func OrderSides() {
  if isThreeSides {
    sideMeasurements.sort()
    calcSideA = sideMeasurements[0]
    calcSideB = sideMeasurements[1]
    calcSideC = sideMeasurements[2]
  } else if isTwoAngles {
    if calcAngleA == Radian(degree: 90) {
      angleMeasurements[2] = calcAngleA
      angleMeasurements[0] = calcAngleC
      sideMeasurements[2] = calcSideA
      sideMeasurements[0] = calcSideC
    } else if calcAngleB == Radian(degree: 90) {
      angleMeasurements[2] = calcAngleB
      angleMeasurements[1] = calcAngleC
      sideMeasurements[2] = calcSideB
      sideMeasurements[1] = calcSideC
    } else if calcAngleC != Radian(degree: 90) && calcAngleC != 0 {
      angleMeasurements[2] = 0
      if calcAngleA == 0 {
        angleMeasurements[0] = calcAngleC
        sideMeasurements[0] = calcSideC
        sideMeasurements[2] = 0
      } else if calcAngleB == 0 {
        angleMeasurements[1] = calcAngleC
        sideMeasurements[1] = calcSideC
        sideMeasurements[2] = 0
      }
    }
    calcAngleA = angleMeasurements[0]
    calcAngleB = angleMeasurements[1]
    calcAngleC = angleMeasurements[2]
    calcSideA = sideMeasurements[0]
    calcSideB = sideMeasurements[1]
    calcSideC = sideMeasurements[2]
    print(calcAngleA, calcAngleB, calcAngleC)
    print(calcSideA, calcSideB, calcSideC)
  } else if isOneAngle {
    if calcAngleA == Radian(degree: 90) {
      angleMeasurements[2] = Radian(degree: 90)
      angleMeasurements[0] = 0
      sideMeasurements[2] = calcSideA
      sideMeasurements[0] = calcSideC
    } else if calcAngleB == Radian(degree: 90) {
      angleMeasurements[2] = Radian(degree: 90)
      angleMeasurements[1] = 0
      sideMeasurements[2] = calcSideB
      sideMeasurements[1] = calcSideC
    } else if calcAngleC != Radian(degree: 90) && calcAngleB != Radian(degree: 90) && calcAngleA != Radian(degree: 90) {
      print("Please provide the right angle!")
    }
    calcAngleA = angleMeasurements[0]
    calcAngleB = angleMeasurements[1]
    calcAngleC = angleMeasurements[2]
    calcSideA = sideMeasurements[0]
    calcSideB = sideMeasurements[1]
    calcSideC = sideMeasurements[2]
    print(calcAngleA, calcAngleB, calcAngleC)
    print(calcSideA, calcSideB, calcSideC)
  }
}

OrderSides()

//allow calculations to pass if not entirely equal

let threshold = 1e-3
func equalKinda(one: Double, two: Double) -> Bool{
  return abs(one - two) < threshold
}

//Determine if the measurements form a triangle

func CheckTriangle() {
  if isThreeSides {
    if (calcSideA + calcSideB) > calcSideC {
      isTriangle = true
    }
  } else if isOneAngle {
    if calcAngleC < Radian(degree: 180) && calcAngleB < Radian(degree: 180) && calcAngleA < Radian(degree: 180) {
      isTriangle = true
    } else if equalKinda(one: sin(calcAngleA), two: calcSideA/calcSideC) || equalKinda(one: cos(calcAngleA), two: calcSideB/calcSideC) || equalKinda(one: tan(calcAngleA), two: calcSideA/calcSideB) {
      isTriangle = true
    } else if equalKinda(one: sin(calcAngleB), two: calcSideB/calcSideC) || equalKinda(one: cos(calcAngleB), two: calcSideA/calcSideC) || equalKinda(one: tan(calcAngleB), two: calcSideB/calcSideA) {
      isTriangle = true
    }
  } else if isTwoAngles {
    if calcAngleC + calcAngleB + calcAngleA < Radian(degree: 180) {
      isTriangle = true
    } else if calcAngleA != 0 && calcAngleA < Radian(degree: 90) {
      isTriangle = true
    } else if calcAngleB != 0 && calcAngleB < Radian(degree: 90) {
      isTriangle = true
    }
  }
  if isTriangle {
    print("You have a triangle!")
  } else {
      print("This is not a triangle!")
  }
}

//Only check if triangle if at least one side measurement is given

if isThreeSides || isOneAngle || isTwoAngles {
  CheckTriangle()
}

//Determine if the measurements form a right triangle

func CheckRight() {
  if isThreeSides {
    if pow(calcSideA, 2) + pow(calcSideB, 2) == pow(calcSideC, 2) {
     isRight = true
    }
  } else if isOneAngle {
    if calcAngleC == Radian(degree: 90) {
      isRight = true
    } else if calcSideA == 0 {
      if calcAngleA != 0 {
        calcAngleC = Radian(degree: 90)
        calcAngleB = calcAngleC - calcAngleA
        if equalKinda(one: sin(calcAngleB) / calcSideB, two: sin(calcAngleC) / calcSideC) {
          isRight = true
        }
      }
      if calcAngleB != 0 {
        calcAngleC = Radian(degree: 90)
        if equalKinda(one: sin(calcAngleB) / calcSideB, two: sin(calcAngleC) / calcSideC) {
          isRight = true
        }
      }
    } else if calcSideB == 0 {
      if calcAngleA != 0 {
        calcAngleC = Radian(degree: 90)
        if equalKinda(one: sin(calcAngleA) / calcSideA, two: sin(calcAngleC) / calcSideC) {
          isRight = true
        }
      } 
      if calcAngleB != 0 {
        calcAngleC = Radian(degree: 90)
        calcAngleA = calcAngleC - calcAngleB 
        if equalKinda(one: sin(calcAngleA) / calcSideA, two: sin(calcAngleC) / calcSideC) {
          isRight = true
        }
      }
    } else if calcSideC == 0 {
      if calcAngleA != 0 {
        calcAngleC = Radian(degree: 90)
        calcAngleB = calcAngleC - calcAngleA
        if equalKinda(one: sin(calcAngleA) / calcSideA, two: sin(calcAngleB) / calcSideB) {
          isRight = true
        }
      }
      if calcAngleB != 0 {
        calcAngleC = Radian(degree: 90)
        calcAngleA = calcAngleC - calcAngleB
        if equalKinda(one: sin(calcAngleA) / calcSideA, two: sin(calcAngleB) / calcSideB) {
          isRight = true
        }
      }
    }
  } else if isTwoAngles {
    if calcAngleA + calcAngleB == Radian(degree: 90) || calcAngleC == Radian(degree: 90) {
      isRight = true
    }
  }
  if isRight {
    print("You have a right triangle!")
  } else {
    print("This is not a right triangle!")
  }
}

//Only check if right if is triangle

if isTriangle {
  CheckRight()
}

//Function to shorten calculation of angles a and b

func CalculateAandB() {
    calcAngleA = acos((pow(calcSideB, 2) + pow(calcSideC, 2) - pow(calcSideA, 2)) / (2 * calcSideB * calcSideC))
    calcAngleB = acos((pow(calcSideA, 2) + pow(calcSideC, 2) - pow(calcSideB, 2)) / (2 * calcSideA * calcSideC))
}

//Determine the remaining measurements based on information provided

func CalculateTriangle () {
  if isThreeSides {
    calcAngleC = Radian(degree: 90)
    calcAngleA = acos((pow(calcSideB, 2) + pow(calcSideC, 2) - pow(calcSideA, 2)) / (2 * calcSideB * calcSideC))
    print(calcAngleA)
    calcAngleB = acos((pow(calcSideA, 2) + pow(calcSideC, 2) - pow(calcSideB, 2)) / (2 * calcSideA * calcSideC))
  } else if isOneAngle {
    if calcAngleC != 0 {
      if calcSideA != 0 && calcSideB != 0 {
        calcSideC = sqrt(pow(calcSideA, 2) + pow(calcSideB, 2))
        CalculateAandB()
      } else if calcSideA != 0 && calcSideC != 0 {
        calcSideB = sqrt(pow(calcSideC, 2) - pow(calcSideA, 2))
        CalculateAandB()
      } else if calcSideB != 0 && calcSideC != 0 {
        calcSideA = sqrt(pow(calcSideC, 2) - pow(calcSideB, 2))
        CalculateAandB()
      }
    } else if calcAngleA != 0 {
      if calcSideA != 0 && calcSideB != 0 {
        calcSideC = sqrt(pow(calcSideA, 2) + pow(calcSideB, 2))
        calcAngleB = calcAngleC - calcAngleA
      } else if calcSideA != 0 && calcSideC != 0 {
        calcSideB = sqrt(pow(calcSideC, 2) - pow(calcSideA, 2))
        calcAngleB = calcAngleC - calcAngleA
      } else if calcSideB != 0 && calcSideC != 0 {
        calcSideA = sqrt(pow(calcSideC, 2) - pow(calcSideB, 2))
        calcAngleB = calcAngleC - calcAngleA
      }
    } else if calcAngleB != 0 {
      if calcSideA != 0 && calcSideB != 0 {
        calcSideC = sqrt(pow(calcSideA, 2) + pow(calcSideB, 2))
        calcAngleA = calcAngleC - calcAngleB
      } else if calcSideA != 0 && calcSideC != 0 {
        calcSideB = sqrt(pow(calcSideC, 2) - pow(calcSideA, 2))
        calcAngleA = calcAngleC - calcAngleB
      } else if calcSideB != 0 && calcSideC != 0 {
        calcSideA = sqrt(pow(calcSideC, 2) - pow(calcSideB, 2))
        calcAngleA = calcAngleC - calcAngleB
      }
    }
  } else if isTwoAngles {
    calcAngleC = Radian(degree: 90)
    if calcAngleA != 0 && calcAngleB != 0 {
      if calcSideA != 0 {
        calcSideB = sin(calcAngleB) / (sin(calcAngleA) / calcSideA)
        calcSideC = sqrt(pow(calcSideA, 2) + pow(calcSideB, 2))
      } else if calcSideB != 0 {
        calcSideA = sin(calcAngleA) / (sin(calcAngleB) / calcSideB)
        calcSideC = sqrt(pow(calcSideA, 2) + pow(calcSideB, 2))
      } else if calcSideC != 0 {
        calcSideA = sin(calcAngleA) / (sin(calcAngleC) / calcSideC)
        calcSideB = sin(calcAngleB) / (sin(calcAngleC) / calcSideC)
      }
    } else if calcAngleA != 0 && calcAngleC != 0 {
      if calcSideA != 0 {
        calcAngleB = calcAngleC - calcAngleA
        calcSideB = sin(calcAngleB) / (sin(calcAngleA) / calcSideA)
        calcSideC = sqrt(pow(calcSideA, 2) + pow(calcSideB, 2))
      } else if calcSideB != 0 {
        calcAngleB = calcAngleC - calcAngleA
        calcSideA = sin(calcAngleA) / (sin(calcAngleB) / calcSideB)
        calcSideC = sqrt(pow(calcSideA, 2) + pow(calcSideB, 2))
      } else if calcSideC != 0 {
        calcAngleB = calcAngleC - calcAngleA
        calcSideA = sin(calcAngleA) / (sin(calcAngleC) / calcSideC)
        calcSideB = sin(calcAngleB) / (sin(calcAngleC) / calcSideC)
      }
    } else if calcAngleB != 0 && calcAngleC != 0 {
      if calcSideA != 0 {
        calcAngleA = calcAngleC - calcAngleB
        calcSideB = sin(calcAngleB) / (sin(calcAngleA) / calcSideA)
        calcSideC = sqrt(pow(calcSideA, 2) + pow(calcSideB, 2))
      } else if calcSideB != 0 {
        calcAngleA = calcAngleC - calcAngleB
        calcSideA = sin(calcAngleA) / (sin(calcAngleB) / calcSideB)
        calcSideC = sqrt(pow(calcSideA, 2) + pow(calcSideB, 2))
      } else if calcSideC != 0 {
        calcAngleA = calcAngleC - calcAngleB
        calcSideA = sin(calcAngleA) / (sin(calcAngleC) / calcSideC)
        calcSideB = sin(calcAngleB) / (sin(calcAngleC) / calcSideC)
      }
    }
  }
}

//Show calculated meausrements

if isRight {
    CalculateTriangle()
    print("Your triangle has the following measurements:")
    print("a = \(calcSideA) b = \(calcSideB) c = \(calcSideC)")
    print("A = \(calcAngleA * 180 / pi) B = \(calcAngleB * 180 / pi) C = \(calcAngleC * 180 / pi)")

}
