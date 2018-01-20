// RUN: %target-swift-frontend -emit-sil -verify %s

import TensorFlow


// Verify AccelerableTensorUnit makes it into the test.
func testAccelerableTensorUnit<T : AccelerableTensorUnit>(a : T) -> T {
  return a
}


func testTensor() {
  _ = Tensor<Float>(1.0)
  _ = Tensor<Int>(2)
  _ = Tensor<Int>([1.0, 2.0]) // expected-error {{cannot convert value of type '[Double]'}}
}
