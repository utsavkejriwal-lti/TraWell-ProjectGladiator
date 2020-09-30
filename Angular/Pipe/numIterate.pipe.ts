import { Pipe, PipeTransform } from '@angular/core';
/*
 * Raise the value exponentially
 * Takes an exponent argument that defaults to 1.
 * Usage:
 *   value | exponentialStrength:exponent
 * Example:
 *   {{ 2 | exponentialStrength:10 }}
 *   formats to: 1024
*/
@Pipe({name: 'numIterate'})
export class NumIterate implements PipeTransform {
  transform(value: number): number[] {
      var nums: number[] = [];
      for(let x = 0; x < value;x++){
          nums[x] = x;
      }
    return nums;
  }
}