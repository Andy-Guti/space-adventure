//
//  Math.hpp
//  SDL Tutorial
//
//  Created by Andy Gutierrez on 4/5/24.
//


#pragma once
#include <stdio.h>
#include <iostream>

struct Vector2f
{
    Vector2f()
    :x(0.0f), y(0.0f)
    {}
    
    Vector2f(float x, float y)
    :x(x), y(y)
    {}
    
    void print()
    {
        std::cout << x << ", " << y << std::endl;
    }
    
    float degToRad(float angle)
    {
        return (angle * M_PI)/180;
    }
    
    void changeY(float angle)
    {
     float rad = degToRad(angle);
     y = cos(rad);
    }

    void changeX(float angle)
    {
     float rad = degToRad(angle);
     x =  sin(rad);
    }
    
    void changePos(float angle)
    {
        changeX(angle);
        changeY(angle);
    }
    
    float x,y;
};



/*
//float changeY(float angle);
//float changeX(float angle);
float changeY(float angle)
{
 float rad = degToRad(angle);
 return cos(rad);
}

float changeX(float angle)
{
 float rad = degToRad(angle);
 return sin(rad);
}
*/
