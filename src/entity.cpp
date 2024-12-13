//
//  entity.cpp
//  SDL Tutorial
//
//  Created by Andy Gutierrez on 4/3/24.
//

#include <stdio.h>
#include <iostream>
#include "Entity.hpp"
#include <SDL2/SDL.h>
#include <SDL_image.h>

Entity::Entity(Vector2f pos, SDL_Texture *texture, int hight, int width)
    : pos(pos), texture(texture)
{
    currentFrame.x = 0;
    currentFrame.y = 0;
    currentFrame.w = width;
    currentFrame.h = hight;
    currentAngle = 0;
}

SDL_Texture *Entity::getTexture()
{
    return texture;
}

SDL_Rect Entity::getCurrentFrame()
{
    return currentFrame;
}

double Entity::getCurrentAngle()
{
    return currentAngle;
}
