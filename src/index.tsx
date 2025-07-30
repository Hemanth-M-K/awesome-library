import AwesomeLibrary from './NativeAwesomeLibrary';

export function multiply(a: number, b: number): number {
  return AwesomeLibrary.multiply(a, b);
}

export function add(a: number, b: number): number {
  return a+b
}

export function sub(a: number, b: number): number {
  const c = b-a
  return c
}