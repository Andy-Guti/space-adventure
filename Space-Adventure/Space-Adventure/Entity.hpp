//
//  Entity.hpp
//  SDL Tutorial
//
//  Created by Andy Gutierrez on 4/3/24.
//

#pragma once
#include <SDL2/SDL.h>
#include <SDL2_image/SDL_image.h>
#include "Math.hpp"
#include <stdio.h>

class Entity
{
public:
    // contructor. Runs by default upon instantiation
    Entity(Vector2f pos, SDL_Texture* texture, int hight, int width);
    Vector2f& getPos()
    {
        return pos;
    }
    void adjustPos(float x, float y)
    {
        pos.x += x * 2;
        pos.y -= y * 2;
        
    }
    double getAngle()
    {
        return angle;
    }
    void adjustAngle(double a)
    {
        angle += a * 2;
    }
    void adjustAcceleration(double b){
        acceleration += b;
    }
    SDL_Texture* getTexture();
    SDL_Rect getCurrentFrame();
    double getCurrentAngle();
private:
    Vector2f pos;
    double currentAngle;
    double angle;
    SDL_Rect currentFrame;
    SDL_Texture* texture;
    double acceleration;
    double velocity;
};
