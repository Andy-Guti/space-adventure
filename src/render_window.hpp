//
//  render_window.hpp
//  SDL Tutorial
//
//  Created by Andy Gutierrez on 4/3/24.
//
#pragma once

#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>

#include "Entity.hpp"

class RenderWindow
{
public:
    RenderWindow(const char *title, int width, int height);
    SDL_Texture *loadTexture(const char *filePath);
    void cleanUp();
    void clear();
    void render(Entity &entity);
    void display();

private:
    SDL_Window *window;
    SDL_Renderer *renderer;
};
