fn countingsort(arr: [int]) -> [int] {
  if arr.len() == 0 {
    return arr
  }

  let max = 0
  for val in arr {
    if val > max {
      max = val
    }
  }

  let count = [0; max + 1]
  for val in arr {
    count[val] += 1
  }

  let output = []
  for i in 0..=max {
    for _j in 0..count[i] {
      output.push(i)
    }
  }

  output
}

fn main() {
  let test = [5, 2, 8, 1, 9, 3]
  println!("{:?}", countingsort(test))
}
