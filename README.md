# MATLAB Root Finding: Bessel Function Eigenvalue Problem

## Background

In solid mechanics, a special elastic wave exists if the following eigenvalue 
relation has a real, non-trivial root (i.e. not x=0):

h(x) = (J_6(x) + J_0(x)) / (J_4(x) - J_2(x)) = 0

where J_n(x) is a Bessel function of the first kind of order n. This project 
finds those roots using three classical root-finding algorithms implemented 
from scratch in MATLAB.

## Files

| File | Description |
|---|---|
| `f.m` | Denominator function: f(x) = J_4(x) - J_2(x) |
| `g.m` | Numerator function: g(x) = J_6(x) + J_0(x) |
| `g_prime.m` | Derivative of g(x), computed using the Bessel recurrence relation |
| `h.m` | Full eigenvalue relation: h(x) = g(x) / f(x) |
| `bisection_denominator.m` | Finds roots of f(x) using the Bisection method |
| `newton_numerator.m` | Finds roots of g(x) using Newton's method |
| `secant_wave.m` | Finds roots of h(x) using the Secant method |
| `solve_wave.m` | Calls all three methods and plots results |

## How to Run

Place all `.m` files in the same directory, then run in MATLAB:

```matlab
solve_wave
```

The plot appears automatically showing roots found by each method.

## Methods

### Bisection
Searches for sign changes of f(x) across unit intervals from -6 to 5. 
When a sign change is found, the interval is halved repeatedly until 
the width is within tolerance. Guaranteed to converge.

### Newton's Method
Starting from initial guesses from -6 to 6, iteratively improves each 
guess using:

x1 = x0 - g(x0) / g'(x0)

The derivative g'(x) is computed explicitly using the Bessel recurrence 
relation: J_n'(x) = (J_{n-1}(x) - J_{n+1}(x)) / 2

### Secant Method
Similar to Newton but approximates the derivative using two points, 
avoiding the need to compute h'(x) explicitly:

x2 = x1 - h(x1) * (x1 - x0) / (h(x1) - h(x0))

Guards are included to handle poles of h(x) where f(x) = 0.

## Results

- Bisection finds roots of f(x) at approximately ±4.20
- Newton finds roots of g(x) at approximately ±2.41, ±5.11
- Secant finds roots of h(x) at approximately ±2.41, ±5.11

![Root Finding Plot](bessel_roots.png)
