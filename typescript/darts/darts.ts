export function score(x: number, y: number): number {
  const x_abs: number = Math.abs(x);
  const y_abs: number = Math.abs(y);
  const boundary: number = x_abs * x_abs + y_abs * y_abs;

  if(boundary > 100) { return 0 }
  if(boundary > 25) { return 1 }
  if(boundary > 1) { return 5 }

  return 10
}
