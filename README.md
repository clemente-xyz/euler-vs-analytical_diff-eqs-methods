# Comparing the Euler method with the analitic method in terms of accuracy in the study of fluid dynamics in a brine tank

In this repository I present some scripts written in Matlab which allow to study from a differential point of view the variations of the salt quantities in the brine mixture as time passes. The algorithms allow us to calculate the rate of accumulation of the brine solution by solving the ordinary differential equations from two points of view: numerically through the Euler method and analytically by traditional methods.

A ```.pdf``` report with the details of the case study is attached to this repository. In it you can see the analysis and conclusions of the case.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* Matlab software.
* Basic knowledge about ordinary differential equations and numeric methods, especially Euler's method.

In addition to being able to run the scripts, the idea is to have knowledge of what is done (read the paper for that).

### Installing

Clone the repo in your local machine ```$ git clone https://github.com/ClementeSerrano/euler_vs_analytical_diffEqsMethods.git``` and open it in the Matlab IDLE. Then just run the script you want.

## About the math model

Below I show the equations that the scripts model and also their respective results.

### The Euler Method

Interpreting the differential equation

![alt text](http://latex.codecogs.com/svg.latex?%5Cfrac%7Bdy%7D%7Bdx%7D%3Df%28x%2Cy%29%5C%3B%5C%3B%7C%5C%3B%5C%3By%28x_0%29%3Dy_0)

as an vector field in the plane ![alt text](http://latex.codecogs.com/svg.latex?xy) and the condition ![alt text](http://latex.codecogs.com/svg.latex?y%28x_0%29%3Dy_0) as a point ![alt text](http://latex.codecogs.com/svg.latex?%28x_0%2Cy_0%29) of that plane, you can approximate the solution function ![alt text](http://latex.codecogs.com/svg.latex?y%28x%29) by means of the tangent line to the same one that passes through that point:

![alt text](http://latex.codecogs.com/svg.latex?%5Cfrac%7Bdy%7D%7Bdx%7D%5Capprox%5C%2Cy_0%2Bf%28x%2Cy%29%28x-x_0%29),

where the slope of that tangent is: ![alt text](http://latex.codecogs.com/svg.latex?m%3Dy%27%28x_0%29) and, consequently, ![alt text](http://latex.codecogs.com/svg.latex?m%3Df%28x_0%2Cy_0%29).

This is how the approximate value of the solution is calculated. Then, evaluating the point of the x-axis ![alt text](http://latex.codecogs.com/svg.latex?x_1) must be applied:

![alt text](http://latex.codecogs.com/svg.latex?y%28x_1%29%5Capprox%5C%2Cy_1%3Dy_0%2Bf%28x_0%2Cy_0%29%28x_1-x_0%29).

With this point already calculated, you can repeat the method to obtain the other approximate point ![alt text](http://latex.codecogs.com/svg.latex?%28x_2%2Cy_2%29). This is done in the following way:

![alt text](ttp://latex.codecogs.com/svg.latex?y%28x_2%29%5Capprox%5C%2Cy_2%3Dy_1%2Bf%28x_1%2Cy_1%29%28x_2-x_1%29).

## Authors

* **Clemente Serrano** - [ClementeSerrano](https://github.com/ClementeSerrano)
